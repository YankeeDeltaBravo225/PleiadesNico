//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct SettingTopView: View {
    var body: some View {
        NavigationView {
            SettingView()
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingTopView_Previews: PreviewProvider {
    static var previews: some View {
        SettingTopView()
    }
}
