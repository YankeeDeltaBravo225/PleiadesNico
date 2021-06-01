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
        Group{
            if(viewModel.hasProp){
                List {
                    Section(header: Text(viewModel.prop.ownerType)){
                        ownerInfoView()
                    }
                    Section(header: Text("動画情報")){
                        videoInfoView()
                        if viewModel.showPlay {
                            playVideoButton()
                        } else {
                            Text(viewModel.cantPlayReason)
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
                }
            } else if viewModel.didAppear {
                ProgressView("Now Loading...")
            } else {
                // Temporal fix for a SwiftUI bug
                reloadButton()
            }
        }
        .onAppear(){
            viewModel.onAppearVideoDetail()
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

    fileprivate func reloadButton() -> some View {
        return ZStack{
            ColorPalette.labelBackground
            Text("タップして画面をリロード")
                .foregroundColor(ColorPalette.label)
        }
        .onTapGesture {
            viewModel.onAppearVideoDetail()
        }
    }


    fileprivate func ownerInfoView() -> some View {
        return
            HStack{
                OnlineImageIView(
                    urlText: viewModel.prop.ownerIcon,
                    width  : 40,
                    height : 30
                )
                    .mask( RoundedRectangle(cornerRadius: 4) )
                    .shadow(color: .gray, radius: 2, x: 2, y: 2)
                    .padding(3)
                Text(viewModel.prop.ownerName)
                    .font(.system(size: 16))
            }
    }


    fileprivate func videoInfoView() -> some View {
        return VideoAbstractView(
            attribute     : viewModel.attr,
            colorIndex    : colorIndex,
            imageWidth    : 128,
            imageHeight   : 72,  // 16:9 aspact rate
            titleFontSize : 14,
            attrFontSize  : 14
        )
        .padding(10)
    }

    
    fileprivate func descriptionView() -> some View {
        return Group(){
            if viewModel.dmcDescription != "" {
                NavigationLink(
                    destination: DescriptionPageView(page: viewModel.dmcDescription )
                ){
                    simpleDescriptionView()
                }
            } else {
                simpleDescriptionView()
            }
        }
    }

    
    fileprivate func simpleDescriptionView() -> some View {
        return VStack(){
            Text(viewModel.prop.description)
                .lineLimit(3)
                .font(.system(size: 14))
            }
    }
    
    
    fileprivate func lastCommentView() -> some View {
        return VStack(){
                Text(viewModel.prop.lastComment)
                    .font(.system(size: 14))
            }
    }
    

    fileprivate func tagsView() -> some View {
        return ForEach(viewModel.prop.tags, id: \.self) { tag in
            NavigationLink(
                destination: SearchView(tag, isImmediate: true)
            ){
                Text(tag)
            }
        }
    }
    

    fileprivate func openBrowserButton() -> some View {
        return FloatingButton(
            action     : { viewModel.onOpenWithBrowser() },
            systemIcon : "safari",
            text       : "外部ブラウザで開く",
            color1     : .green,
            color2     : .blue
        )
    }

    
    fileprivate func playVideoButton() -> some View {
        return FloatingButton(
            action     : { doesPlay.toggle() },
            systemIcon : "play.circle",
            text       : "内蔵プレイヤーで再生",
            color1     : .purple,
            color2     : .red
        )
        .fullScreenCover(isPresented: $doesPlay){
            PlayerTopView(videoId, colorIndex: colorIndex, title : viewModel.prop.title, showPlayer: $doesPlay)
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
