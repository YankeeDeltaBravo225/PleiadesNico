//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI


// MARK: - View
struct SpecificMylistView: View {
    
    @ObservedObject var viewModel : SpecificMylistViewModel
    let listId   : String
    let listName : String

    
    init( listId : String, listName : String ){
        self.viewModel = SpecificMylistViewModel( listId: listId )
        self.listId    = listId
        self.listName  = listName
    }


    var body: some View {
        List{
            ForEach(viewModel.videos.indices, id: \.self) { index in
                let item  = viewModel.videos[index]
                NavigationLink(
                    destination: VideoDetailView(item.contentId, colorIndex: index)
                ){
                    VideoAbstractView(
                        attribute     : item,
                        colorIndex    : index,
                        imageWidth    : 96,
                        imageHeight   : 54, // 16:9 aspact rate
                        titleFontSize : 14,
                        attrFontSize  : 14
                    )
                }
            }
        }
        .onAppear(){
            viewModel.onAppearSpecificMylist()
        }
    }
}


// MARK: - Preview
struct SpecificMylistView_Previews: PreviewProvider {
    static var previews: some View {
        SpecificMylistView( listId: "123456", listName: "sample" )
    }
}
