//
//  SearchView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/10.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var viewModel : SearchViewModel
    
    init(_ tag : String = "" ){
        viewModel = SearchViewModel( tag )
    }

    
    var body: some View {
        VStack{
            searchFieldView()
            
            List{
                if viewModel.showNoHit {
                    Text("該当なし")
                }
                ForEach(viewModel.items.indices, id: \.self) { index in
                    let item  = viewModel.items[index]
                    NavigationLink(
                        destination: VideoDetailView(item.contentId)
                    ){
                        videoAbstractView(index)
                    }
                }
                if viewModel.showAdd {
                    Button(action: { viewModel.contSearch() }){
                        Text("タップしてさらに読み込み")
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .toolbar{
            ToolbarItem(placement:.principal ){
                kindSelectView()
            }
        }
        .onAppear(){
            viewModel.onAppearSearch()
        }
    }
}

extension SearchView {

    fileprivate func kindSelectView() -> some View {
        return Picker("SearchKind", selection: $viewModel.kind) {
            ForEach(SearchAPI.Kind.allCases, id: \.self) { (kind) in
                Text(kind.rawValue)
            }
        }
        .labelsHidden()
        .pickerStyle(SegmentedPickerStyle())
    }


    fileprivate func videoAbstractView(_ index : Int) -> some View {
        let item  = viewModel.items[index]
        let color = ColorPalette.pastel( index )
        
        return HStack{
                Color(red: color.r, green: color.g, blue: color.b)
                    .frame(width:4)
                VideoAbstractView(
                    title    : item.title,
                    thumbnail: item.thumbnailUrl,
                    uploaded : item.startTime,
                    duration : DateTimeFormat.shared.duration(item.lengthSeconds),
                    views    : String(item.viewCounter),
                    comments : String(item.commentCounter)
                )
            }
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
