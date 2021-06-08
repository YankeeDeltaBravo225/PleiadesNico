//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import WebKit


// MARK:- View
struct SettingView: View {

    @ObservedObject var viewModel : SettingViewModel

    private let isPad : Bool = UIDevice.current.userInterfaceIdiom == .pad

    init(){
        viewModel = SettingViewModel()
    }


    var body: some View {
        
        List {
            Section(header: Text("アカウント")){
                loginPageView()
                loginStatusView()
            }
            Section(header: Text("プレイヤー")){
                if !isPad {
                    HStack{
                        Text("再生時の向き")
                        Spacer()
                        orientationSelector()
                    }
                }
                
                controlFadeTimeStepper()
                commentFontSizeStepper()
                commentStrokeSizeStepper()
                commentMaxDispNumStepper()
            }
            Section(header: Text("ジェスチャー")){
                ForEach(viewModel.gestureTypeOptions().keys.sorted(), id: \.self) { gestureType in
                    gestureSelector(gestureType)
                }

                swipeThresholdStepper()
            }
            Section(header: Text("このアプリについて")){
                appVersionView()
                iosVersionView()
                deviceTypeView()
                feedbackView()
            }
            Section(header: Text("OSSライセンス")){
                ForEach(CommonData.ossLicenses.sorted(by: >), id: \.key) { key, value in
                    licenseView(key, value)
                }
            }
            
        } //List
    } // body

}


extension SettingView {

    fileprivate func loginPageView() -> some View {
        return NavigationLink(
            destination: Group(){
                WebView(
                    viewModel.loginPageUrl,
                    onDisappear: {webView in
                        viewModel.onLogginDisappear(webView: webView)
                    }
                )
            }
        ){
            Text("ログイン/ユーザ設定の確認")
        }
    }


    fileprivate func loginStatusView() -> some View {
        return HStack{
            Text("状態：")
            if viewModel.isLoggedIn {
                Image(systemName: "checkmark.circle")
            } else {
                Image(systemName: "x.circle.fill")
            }
            Spacer()
        }
    }

    
    fileprivate func commentFontSizeStepper() -> some View {
        return VStack{
            HStack{
                Text("コメントのサイズ")
                Spacer()
            }
            HStack{
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
    }

    
    fileprivate func commentStrokeSizeStepper() -> some View {
        return VStack{
            HStack{
                Text("コメントの線の太さ")
                Spacer()
            }
            HStack{
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
    }

    
    fileprivate func commentMaxDispNumStepper() -> some View {
        return VStack{
            HStack{
                Text("同時に表示する最大コメント数")
                Spacer()
            }
            HStack{
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
    }

    
    fileprivate func controlFadeTimeStepper() -> some View {
        return VStack{
            HStack{
                Text("コントロールが自動で隠れるまで(秒)")
                Spacer()
            }
            HStack{
                Stepper(
                    value : $viewModel.controlFadeTime,
                    in : 1...99,
                    step : 1,
                    onEditingChanged: {viewModel.onControlFadeTimeChanged($0)}
                ){
                    Text("\(viewModel.controlFadeTime)")
                }
            }
        }
    }


    fileprivate func orientationSelector() -> MenuStylePicker {
        return MenuStylePicker(
            options: viewModel.orientationOptions(),
            onChangeClosure: { viewModel.onOrietationChanged($0) },
            color1 : .blue,
            color2 : .green,
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
                color1 : .blue,
                color2 : .green,
                selected: viewModel.gestureOperationSelects[gestureType]
            )
        }
    }

    
    fileprivate func swipeThresholdStepper() -> some View {
        return VStack{
            HStack{
                Text("スワイプ認識する移動量")
                Spacer()
            }
            HStack{
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


    fileprivate func feedbackView() -> some View {
        return Group(){
            NavigationLink( destination: FeedbackView(viewModel: viewModel) ){
                Text("フィードバック")
            }
        }
    }


    fileprivate func iosVersionView() -> some View {
        return HStack{
            Text("OS")
            Spacer()
            Text("\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
        }
    }


    fileprivate func appVersionView() -> some View {
        return HStack{
            Text("アプリバージョン")
            Spacer()
            Text(CommonData.appVersion)
        }
    }

    
    fileprivate func deviceTypeView() -> some View {
        return HStack{
            Text("機種")
            Spacer()
            Text(verbatim: UIDevice().model)
        }
    }
    
    
    fileprivate func licenseView(_ key: String, _ value: String) -> some View {
        return Group(){
            NavigationLink(
                destination:
                    VStack{
                        Text(key)
                            .font(.title)
                        ScrollView(){ Text(value)}
                    }
            ){
                Text(key)
            }
        }
    }

}


// MARK:- Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
