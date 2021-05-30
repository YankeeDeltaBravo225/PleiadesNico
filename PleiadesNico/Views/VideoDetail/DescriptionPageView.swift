//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI
import WebKit

struct DescriptionPageView: View {
    
    let page : String
    
    var body: some View {
        DescriptionWebView( text : page )
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}

struct DescriptionWebView: UIViewRepresentable {
  let text: String
   
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
   
  func updateUIView(_ webView: WKWebView, context: Context) {
    
    let header = "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>"
    
    webView.loadHTMLString(header + text, baseURL: nil)
  }
}

struct DescriptionPageView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionPageView(page : "<html><body>Hello world</body></html>" )
    }
}
