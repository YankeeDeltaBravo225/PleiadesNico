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
            reloadButton()
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
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(){
            viewModel.onAppearMylistGroup()
        }
    }
}


// MARK: - Extension
extension MylistGroupView {

    fileprivate func reloadButton() -> FloatingButton {
        return FloatingButton(
            action     : { viewModel.fetchMylistGroup() },
            systemIcon : "arrow.counterclockwise",
            text       : "リロード",
            color1     : .pink,
            color2     : .purple
        )
    }

}


// MARK: - Preview
struct MylistGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MylistGroupView()
    }
}
