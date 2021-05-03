//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import WebKit


// MARK:- WebView
struct WebView: View {

    typealias OnDisappear = (_ webView : WKWebView) -> Void
    
    let webView     : WKWebView
    let url         : URL?
    let urlValid    : Bool
    let onDisappear : OnDisappear?


    init(_ urlText : String, onDisappear : @escaping OnDisappear){
        self.webView = WKWebView()

        guard let url = URL(string: urlText)
        else {
            self.url      = nil
            self.urlValid = false
            self.onDisappear = nil
            return
        }

        self.url         = url
        self.urlValid    = true
        self.onDisappear = onDisappear
    }
    
    var body: some View {
        if self.urlValid {
            WebViewRepresentable(url: self.url!, webView: self.webView)
                .onDisappear(){
                    print("WebView Disappear")
                    self.onDisappear?(self.webView)
                }
        } else {
            Text("Error! cannot open the page")
        }
        
    }
}


// MARK:- WebView Representable
struct WebViewRepresentable: UIViewRepresentable {
    var url     : URL
    let webView : WKWebView

//    @ObservedObject var observe = observable()

    func makeUIView(context: Context) -> WKWebView {
/*
        let cookies = HTTPCookieStorage.shared.cookies ?? []
        for cookie in cookies {
            webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
        }
 */
        return self.webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
/*
        observe.observation = uiView.observe(\WKWebView.url, options: .new) { view, change in
            if let url = uiView.url {
                print("Page loaded: \(url)")
            }
        }
*/

        uiView.load(URLRequest(url: self.url))
    }

/*
    class observable: ObservableObject {
        @Published var observation:NSKeyValueObservation?
    }
 */
}


// MARK:- Preview
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(
            "https://account.nicovideo.jp",
            onDisappear:{_ in
                print("WebView Preiew Disappear")
            }
        )
    }
}
