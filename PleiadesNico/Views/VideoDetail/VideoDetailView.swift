//
//  VideoDetailView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/05.
//

import SwiftUI

struct VideoDetailView: View {
    
    let videoId    : String
    let colorIndex : Int
    @ObservedObject var viewModel : VideoDetailViewModel
    @State private var doesPlay = false

    
    init(_ videoId : String, colorIndex : Int ){
        self.videoId    = videoId
        self.colorIndex = colorIndex
        self.viewModel  = VideoDetailViewModel(videoId: videoId)
    }

    var body: some View {

            List {
                if(viewModel.hasProp){
                    Section(header: Text(viewModel.prop.ownerType)){
                        ownerInfoView()
                    }
                    Section(header: Text("動画情報")){
                        videoInfoView()
                        if viewModel.showPlay {
                            playVideoButton()
                        } else {
                            Text("(内蔵プレイヤー非対応の動画です)")
                        }
                        openBrowserButton()
                    }
                    Section(header: Text("概要")){
                        descriptionView()
                    }
                    Section(header: Text("最新コメント")){
                        lastCommentView()
                    }
                    Section(header: Text("タグ")){
                        tagsView()
                            .navigationBarTitleDisplayMode(.inline)
                    }
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

    fileprivate func ownerInfoView() -> some View {
        return
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


    fileprivate func videoInfoView() -> some View {
        let prop = viewModel.prop
        
        return VideoAbstractView(
            title         : prop.title,
            thumbnail     : prop.thumbnail,
            uploaded      : DateTimeFormat.shared.dateFromISO8601(prop.uploaded),
            duration      : prop.duration,
            views         : prop.views,
            comments      : prop.comments,
            mylists       : prop.mylists,
            colorIndex    : colorIndex,
            imageWidth    : 160,
            imageHeight   : 120,
            titleFontSize : 14,
            attrFontSize  : 14
        )
        .padding(10)
    }

    
    fileprivate func descriptionView() -> some View {
        return ScrollView(){
            Text(viewModel.prop.description)
                    .font(.system(size: 14))
            }
            .frame(height:100)
    }
    
    
    fileprivate func lastCommentView() -> some View {
        return ScrollView(){
                Text(viewModel.prop.lastComment)
                    .font(.system(size: 14))
            }
            .frame(height:50)
    }
    

    fileprivate func tagsView() -> some View {
        return ForEach(viewModel.prop.tags, id: \.self) { tag in
            NavigationLink(
                destination: SearchView(tag)
            ){
                Text(tag)
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
                    Text("外部ブラウザで開く")
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
        
        VideoDetailView(videoId, colorIndex: 3)
    }
}
