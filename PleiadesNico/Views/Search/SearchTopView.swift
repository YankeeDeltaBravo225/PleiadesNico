//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct SearchTopView: View {
    var body: some View {
        NavigationView {
            SearchView("", isImmediate: false)
        }
    }
}

struct SearchTopView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTopView()
    }
}
