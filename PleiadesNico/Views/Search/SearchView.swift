//
//  SearchView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel : SearchViewModel
    @State var showSortSelector: Bool = false


    init(_ tag : String = "" ){
        viewModel = SearchViewModel( tag )
    }

    
    var body: some View {
        VStack{
            tagKeywordSelector()
            searchFieldView()
            
            List{
                if viewModel.showNoHit {
                    Text("該当なし")
                }
                ForEach(viewModel.resultItems.indices, id: \.self) { index in
                    let item  = viewModel.resultItems[index]
                    NavigationLink(
                        destination: VideoDetailView(item.contentId, colorIndex: index)
                    ){
                        videoAbstractView(index)
                    }
                }
                if viewModel.showAdd {
                    Button(action: { viewModel.contSearch() }){
                        Image(systemName: "chevron.compact.down")
                        Text("タップしてさらに読み込み")
                            .padding(4)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .toolbar{
            ToolbarItem(placement:.principal ){
                Button(action: { showSortSelector.toggle() }){
                    Image(systemName: "slider.horizontal.3")
                    Text(viewModel.sortText)
                        .padding(4)
                }
                .sheet(isPresented: $showSortSelector) {
                    OrderSelectView(viewModel: viewModel)
                }
            }
        }
        .onAppear(){
            viewModel.onAppearSearch()
        }
    }
}

extension SearchView {

    fileprivate func tagKeywordSelector() -> some View {
        return Picker("SearchKind", selection: $viewModel.seachKind) {
            ForEach(SearchAPI.Kind.allCases, id: \.self) { (kind) in
                Text(kind.rawValue)
            }
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }


    fileprivate func videoAbstractView(_ index : Int) -> some View {
        let item  = viewModel.resultItems[index]
        
        return VideoAbstractView(
            title         : item.title,
            thumbnail     : item.thumbnailUrl,
            uploaded      : TextFormat.shared.dateFromISO8601(item.startTime),
            duration      : TextFormat.shared.duration(item.lengthSeconds),
            views         : String(item.viewCounter),
            comments      : String(item.commentCounter),
            mylists       : String(item.mylistCounter),
            colorIndex    : index,
            imageWidth    : 100,
            imageHeight   : 75,
            titleFontSize : 12,
            attrFontSize  : 12
        )
    }

    
    fileprivate func searchFieldView() -> some View {
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
    
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView("TDN")
    }
}
