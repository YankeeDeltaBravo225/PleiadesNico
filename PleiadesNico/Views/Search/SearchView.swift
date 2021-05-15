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
                    HStack{
                        searchKindSelector()
                        sortKeySelector()
                        sortOrderSelector()
                    }
                    searchWordEditor()
                }
                
                if viewModel.showNoHit {
                    Text("該当なし")
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
                ToolbarItem(placement:.navigationBarLeading ){
                    Text(viewModel.abstractText)
                        .frame(maxWidth: geometry.size.width - 120)
                        .lineLimit(1)
                }
            }
            .onAppear(){
                print(geometry.size.width)
                viewModel.onAppearSearch()
            }
        } // GeometryReader
    } // View
}

extension SearchView {

    fileprivate func sortKeySelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.sortKeys.map{ $0.description },
            onChangeClosure: { keyId in viewModel.updateSortKey(newKeyId: keyId) },
            selected: viewModel.keyId
        )
    }


    fileprivate func sortOrderSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.sortOrders().map{ $0.description },
            onChangeClosure: { orderId in viewModel.updateSortOrder(newOrderId: orderId) },
            selected: viewModel.orderId
        )
    }


    fileprivate func searchKindSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.searchKindTexts,
            onChangeClosure: { kindId in viewModel.updateSearchKind(newKindId: kindId) },
            selected: viewModel.searchKindId
        )
    }
 

    fileprivate func searchWordEditor() -> some View {
        UITextField.appearance().clearButtonMode = .whileEditing
        return HStack{
            Image(systemName: "magnifyingglass")
            TextField(
                "タグ or キーワード を入力",
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
