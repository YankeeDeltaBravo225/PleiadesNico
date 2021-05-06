//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct TestbedView: View {
    @State private var selection = 3    // 選択値と連携するプロパティ
    
    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("フルーツ")) {
                Text("みかん").tag(1)
                Text("ぶどう").tag(2)
                Text("りんご").tag(3)
                Text("バナナ").tag(4)
                Text("もも").tag(5)
            }
            
            Text("選択値：\(selection)")
        }
    }
}

struct TestbedView_Previews: PreviewProvider {
    static var previews: some View {
        TestbedView()
    }
}
