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
            
            Section(header: Text("コメント")){
                Text("フォントサイズ")
                HStack{
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
        }

        

    }
}


extension SettingView {

    fileprivate func loginPageButton() -> some View {
        return Button("ログイン/ユーザ設定の確認(内蔵ブラウザが開きます)") {
            self.showLogin.toggle()
        }
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

}


// MARK:- Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
