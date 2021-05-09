//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct TestbedView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]

    var body: some View {
        Form {
            Section {
                Picker("Strength", selection: $selectedStrength) {
                    ForEach(strengths, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct TestbedView_Previews: PreviewProvider {
    static var previews: some View {
        TestbedView()
    }
}
