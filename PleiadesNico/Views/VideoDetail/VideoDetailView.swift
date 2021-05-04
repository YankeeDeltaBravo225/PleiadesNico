//
//  VideoDetailView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import SwiftUI

struct VideoDetailView: View {
    
    let videoId : String
    @ObservedObject var viewModel : VideoDetailViewModel
    @State private var doesPlay = false

    
    init(_ contentId : String ){
        videoId   = contentId
        viewModel = VideoDetailViewModel(videoId: contentId)
    }

    var body: some View {

            List {
                if(viewModel.hasProp){
                    ownerSectionView()
                    infoSectionView()
                    if viewModel.showPlay {
                        playVideoButton()
                    } else {
                        Text("内蔵プレイヤーで再生できません")
                    }
                    openBrowserButton()
                    descriptionSectionView()
                    lastCommentSectionView()
                    tagSectionView()
                        .navigationBarTitleDisplayMode(.inline)
                } else {
                    Text("読み込み中")
                }
        }
        .onAppear(){
            viewModel.loadVideoDetail(videoId: videoId)
        }

    }

    struct DetailPropertyView: View {
        let symbol : String
        let text   : String
        let size   : CGFloat

        var body: some View {
            HStack{
                Image(systemName: symbol)
                    .resizable()
                    .frame(width:size, height:size)
                Text(text)
                    .font(.system(size: size))
                Spacer()
            }
        }
    }

}

extension VideoDetailView {

    fileprivate func ownerSectionView() -> some View {
        return Section(header: Text(viewModel.prop.ownerType)){
            HStack{
                OnlineImageIView(
                    urlText: viewModel.prop.ownerIcon,
                    width  : 40,
                    height : 30
                )
                Text(viewModel.prop.ownerName)
                    .font(.system(size: 16))
            }
        }
    }


    fileprivate func infoSectionView() -> some View {
        return Section(header: Text("動画情報")){
            VStack(alignment: .leading){
                Text(viewModel.prop.title)
                    .font(.system(size: 16))
            }
            HStack{
                OnlineImageIView(
                    urlText: viewModel.prop.thumbnail,
                    width  : 160,
                    height : 120
                )
                Divider()
                VStack{
                    DetailPropertyView(
                        symbol: "clock",
                        text  : viewModel.prop.duration,
                        size  : 14
                    )
                    DetailPropertyView(
                        symbol: "play",
                        text  : viewModel.prop.views,
                        size  : 14
                    )
                    DetailPropertyView(
                        symbol: "text.bubble",
                        text  : viewModel.prop.comments,
                        size  :14
                    )
                    DetailPropertyView(
                        symbol: "star",
                        text  : viewModel.prop.mylists,
                        size  :14
                    )
                }
            }
            VStack(alignment: .leading){
                DetailPropertyView(
                    symbol: "calendar",
                    text  : viewModel.prop.uploaded,
                    size  : 14
                )
                HStack{
                    Text("\(viewModel.prop.videoId)")
                        .font(.system(size: 14))
                    Divider()
                    Text("\(viewModel.prop.fileType)")
                        .font(.system(size: 14))
                }
            }
        }
    }

    
    fileprivate func descriptionSectionView() -> some View {
        return Section(header: Text("概要")){
            ScrollView(){
                Text(viewModel.prop.description)
                    .font(.system(size: 14))
            }
            .frame(height:100)
        }
    }
    
    
    fileprivate func lastCommentSectionView() -> some View {
        return Section(header: Text("最新コメント")){
            ScrollView(){
                Text(viewModel.prop.lastComment)
                    .font(.system(size: 14))
            }
            .frame(height:50)
        }
    }
    

    fileprivate func tagSectionView() -> some View {
        return Section(header: Text("タグ")){
            ForEach(viewModel.prop.tags, id: \.self) { tag in
                NavigationLink(
                    destination: SearchView(tag)
                ){
                    Text(tag)
                }
            }
        }
    }
    
    fileprivate func openBrowserButton() -> some View {
        return Button(
            action: {
                viewModel.onOpenWithBrowser()
            },
            label: {
                HStack(){
                    Image(systemName:"safari")
                    Text("ブラウザで開く")
                    Spacer()
                }
            }
        )
    }
    
    fileprivate func playVideoButton() -> some View {
        return Button(
            action: {
                doesPlay.toggle()
            },
            label: {
                HStack(){
                    Image(systemName:"play.circle")
                    Text("内蔵プレイヤーで再生")
                    Spacer()
                }
            }
        )
        .fullScreenCover(isPresented: $doesPlay){
            PlayerTopView(videoId)
        }
    }

}


struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {

//        let videoId = "so38523333"
        let videoId = "sm35919998"
        
        VideoDetailView(videoId)
    }
}
