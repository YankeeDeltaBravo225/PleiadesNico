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
        Button("ログイン/ユーザ設定の確認") {
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
}


// MARK:- Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
