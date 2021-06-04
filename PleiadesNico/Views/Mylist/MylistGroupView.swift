//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

// MARK: - View
struct MylistGroupView: View {
    
    @ObservedObject var viewModel : MylistGroupViewModel
    
    init(){
        viewModel = MylistGroupViewModel()
    }

    
    var body: some View {
        VStack(){
            List(){
                ForEach(viewModel.mylists.indices, id: \.self) { index in
                    let listId   = viewModel.mylists[index].id
                    let listName = viewModel.mylists[index].name
                    
                    NavigationLink(
                        destination: SpecificMylistView(
                            listId    : listId,
                            listName  : listName
                        )
                    ){
                        Text(listName)
                    }
                }
                if !viewModel.isLoggedIn{
                    Text("ログインしていません")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {viewModel.fetchMylistGroup()}) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
        .onAppear(){
            viewModel.onAppearMylistGroup()
        }
    }
}


// MARK: - Preview
struct MylistGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MylistGroupView()
    }
}
