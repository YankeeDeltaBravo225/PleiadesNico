//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

// MARK:- View
struct FeedbackView: View {

    @ObservedObject var viewModel : SettingViewModel
    
    @State private var feedback  = [
        "アプリのバージョン: " + CommonData.appVersion,
        "機種名: " + UIDevice().model,
        "OS: " + UIDevice.current.systemName + UIDevice.current.systemVersion,
        "",
        "",
        "問題の起きた動画ID:",
        "",
        "",
        "バグの詳細/要望など:",
        "",
        ""
    ].reduce(""){$0 + "\n" + $1}

    var body: some View {
        VStack{
            Text("フィードバック内容")
                .font(.title2)
            TextEditor(text: $feedback)
            Divider()
            HStack{
                copyButton()
                reportBugButton()
            }
        }
    }
}


// MARK:- Extension
extension FeedbackView {

    fileprivate func reportBugButton() -> some View {
        return FloatingButton(
            action     : { viewModel.onOpenSupportTwitter() },
            systemIcon : "paperplane",
            text       : "作者Twitter",
            color1     : .blue,
            color2     : .blue
        )
    }


    fileprivate func copyButton() -> some View {
        return FloatingButton(
            action     : { UIPasteboard.general.string = feedback },
            systemIcon : "doc.on.doc",
            text       : "内容コピー",
            color1     : .green,
            color2     : .green
        )
    }
    
}



// MARK: - Preview
struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView( viewModel : SettingViewModel() )
    }
}
