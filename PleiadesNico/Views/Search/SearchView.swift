//
//  SearchView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel : SearchViewModel


    init(_ word : String = "", isImmediate : Bool ){
        viewModel = SearchViewModel( word, isImmediate: isImmediate )
    }


    var body: some View {
        GeometryReader { geometry in
            List{
                VStack{
                    searchWordEditor()
                    searchKindSelector()
                    HStack{
                        sortKeySelector()
                        sortOrderSelector()
                    }
                }
                
                if viewModel.showDirectOpen {
                    NavigationLink(
                        destination: VideoDetailView(viewModel.directVideoId, colorIndex: 0)
                    ){
                        Text("\(viewModel.directVideoId) を直接開く")
                            .padding(20)
                    }
                }
                
                if viewModel.showNoHit {
                    Text("検索結果なし")
                }
                ForEach(viewModel.resultItems.indices, id: \.self) { index in
                    let item  = viewModel.resultItems[index]
                    NavigationLink(
                        destination: VideoDetailView(item.contentId, colorIndex: index)
                    ){
                        SearchResultRowView(item: item, index: index)
                    }
                }
                if viewModel.showLoading {
                    loadingView()
                }
                if viewModel.showAdd {
                    contSearchButton()
                }
            } // List
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .toolbar{
                ToolbarItem(placement : .navigationBarLeading ){
                    Text(viewModel.abstractText)
                        .frame(maxWidth: geometry.size.width - 120)
                        .lineLimit(1)
                }
            }
            .onAppear(){
                viewModel.onAppearSearch()
            }
        } // GeometryReader
    } // View
}

extension SearchView {

    fileprivate func sortKeySelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.sortKeyOptions(),
            onChangeClosure: { keyId in viewModel.updateSortKey(newKeyId: keyId) },
            color1 : .blue,
            color2 : .green,
            selected: viewModel.orderKeyId
        )
    }


    fileprivate func sortOrderSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.sortDirectionOptions(),
            onChangeClosure: { directionId in
                viewModel.updateSortDirection(newDirectionId: directionId)
            },
            color1 : .green,
            color2 : .blue,
            selected: viewModel.orderDirectionId
        )
    }


    fileprivate func searchKindSelector() -> SegmentStylePicker {
        return SegmentStylePicker(
            options: viewModel.searchKindOptions(),
            onChangeClosure: { kindId in viewModel.updateSearchKind(newKindId: kindId) },
            selected: viewModel.searchKindId
        )
    }
 

    fileprivate func searchWordEditor() -> some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return HStack{
            Image(systemName: "magnifyingglass")
            TextField(
                "タグ or キーワード or 動画ID",
                text: $viewModel.searchWord,
                onCommit: { viewModel.newSearch() }
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(10)
    }

    
    fileprivate func loadingView() -> some View {
        return HStack{
            Spacer()
            ProgressView("Now Loading...")
            Spacer()
        }
    }
    
    
    fileprivate func contSearchButton() -> some View {
        return HStack{
            Spacer()
            Button(action: { viewModel.contSearch() }){
                Image(systemName: "chevron.compact.down")
                Text("タップしてさらに読み込み")
                    .padding(20)
            }
            Spacer()
        }
    }
    
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView("大迫", isImmediate: false)
    }
}
