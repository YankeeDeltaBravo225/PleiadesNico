//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import WebKit

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
            onDismiss: {print("画面を閉じた")})
        {
            WebView(
                "https://account.nicovideo.jp",
                onDisappear: {webView in
                    viewModel.onLogginDisappear(webView: webView)
                }
            )
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
