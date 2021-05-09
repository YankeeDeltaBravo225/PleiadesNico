//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import WebKit


// MARK:- View
struct SettingView: View {

    @State private var showLogin = false

    @ObservedObject var viewModel : SettingViewModel


    init(){
        viewModel = SettingViewModel()
    }

    
    var body: some View {
        
        List {
            Section(header: Text("アカウント")){
                loginPageButton()
                loginStatusView()
            }
            
            Section(header: Text("プレイヤー")){
                Text("コメントのフォント")
                commentFontSizeStepper()
                Text("再生コントロールが閉じるまで")
                controlFadeTimeStepper()
            }
        }

        

    }
}


extension SettingView {

    fileprivate func loginPageButton() -> some View {
        return FloatingButton(
            action     : { self.showLogin.toggle() },
            systemIcon : "safari",
            text       : "ログイン/ユーザ設定の確認"
        )
        .sheet(
            isPresented: $showLogin,
            onDismiss: {}
        )
        {
            WebView(
                viewModel.loginPageUrl,
                onDisappear: {webView in
                    viewModel.onLogginDisappear(webView: webView)
                }
            )
        }
    }


    fileprivate func loginStatusView() -> some View {
        return HStack{
            Text("状態：")
            Divider()
            if viewModel.isLoggedIn {
                Image(systemName: "checkmark.circle")
            } else {
                Image(systemName: "x.circle.fill")
            }
            Spacer()
        }
    }

    
    fileprivate func commentFontSizeStepper() -> some View {
        return HStack{
            Stepper(
                value : $viewModel.commentFontSize,
                in : 10...50,
                step : 1,
                onEditingChanged: {viewModel.onCommentFontSizeChanged($0)}
            )
            {
                Text("サイズ")
                Divider()
                Text("\(viewModel.commentFontSize)")
            }
            Spacer()
        }
    }

    fileprivate func controlFadeTimeStepper() -> some View {
        return HStack{
            Stepper(
                value : $viewModel.controlFadeTime,
                in : 1...99,
                step : 1,
                onEditingChanged: {viewModel.onControlFadeTimeChanged($0)}
            )
            {
                Text("秒数")
                Divider()
                Text("\(viewModel.controlFadeTime)")
            }
            Spacer()
        }
    }

}


// MARK:- Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
