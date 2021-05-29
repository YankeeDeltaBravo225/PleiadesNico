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
                HStack{
                    Text("ログイン/ユーザ設定の確認")
                    Spacer()
                    loginPageButton()
                }
                loginStatusView()
            }
            Section(header: Text("プレイヤー")){
                if UIDevice.current.userInterfaceIdiom == .phone {
                    HStack{
                        Text("再生時の向き")
                        Spacer()
                        orientationSelector()
                    }
                }
                Text("コントロールが自動で隠れるまで(秒)")
                controlFadeTimeStepper()
            }
            Section(header: Text("コメント")){
                Text("フォントサイズ")
                commentFontSizeStepper()
                Text("線の太さ")
                commentStrokeSizeStepper()
                Text("同時表示する最大数")
                commentMaxDispNumStepper()
            }
            Section(header: Text("ジェスチャー")){
                ForEach(viewModel.gestureTypeOptions().keys.sorted(), id: \.self) { gestureType in
                    gestureSelector(gestureType)
                }

                Text("スワイプ認識する移動量")
                swipeThresholdStepper()
            }

        } //List
    } // body

}


extension SettingView {

    fileprivate func loginPageButton() -> some View {
        return FloatingButton(
            action     : { self.showLogin.toggle() },
            systemIcon : "safari",
            text       : "開く"
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
                Text("\(viewModel.commentFontSize)")
            }
            Spacer()
        }
    }

    
    fileprivate func commentStrokeSizeStepper() -> some View {
        return HStack{
            Stepper(
                value : $viewModel.commentStrokeSize,
                in : 1...10,
                step : 1,
                onEditingChanged: {viewModel.onCommentStrokeSizeChanged($0)}
            ){
                Text("\(viewModel.commentStrokeSize)")
            }
            Spacer()
        }
    }

    
    fileprivate func commentMaxDispNumStepper() -> some View {
        return HStack{
            Stepper(
                value : $viewModel.commentMaxDispNum,
                in : 10...1000,
                step : 10,
                onEditingChanged: {viewModel.onCommentMaxDispNumChanged($0)}
            ){
                Text("\(viewModel.commentMaxDispNum)")
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
            ){
                Text("\(viewModel.controlFadeTime)")
            }
            Spacer()
        }
    }


    fileprivate func orientationSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.orientationOptions(),
            onChangeClosure: { viewModel.onOrietationChanged($0) },
            selected: viewModel.playerOrientation
        )
    }

    
    fileprivate func gestureSelector(_ gestureType: Int) -> some View {
        let typeDescription = viewModel.gestureTypeOptions()[gestureType] ?? "?"
        return HStack{
            Text(typeDescription)
            Spacer()
            MenuStylePicker(
                options: viewModel.gestureOperationOptions(),
                onChangeClosure: {
                    viewModel.onGestureChanged(gestureType: gestureType, newOperation: $0)
                },
                selected: viewModel.gestureOperationSelects[gestureType]
            )
        }
    }

    
    fileprivate func swipeThresholdStepper() -> some View {
        return HStack{
            Stepper(
                value : $viewModel.swipeThreshold,
                in : 10...300,
                step : 10,
                onEditingChanged: {viewModel.onSwipeThresholdChanged($0)}
            ){
                Text("\(viewModel.swipeThreshold)")
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
