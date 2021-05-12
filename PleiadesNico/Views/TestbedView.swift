//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct TestbedView: View {
    @State var selection: String = "one"
    
    var array: [String] = ["one", "two", "three", "four", "five"]

    var body: some View {
        Picker(selection: $selection, label: Text(selection).frame(width: 100), content: {
            ForEach(array, id: \.self, content: { word in
                Text(word).tag(word)
            })
        })
        .pickerStyle(MenuPickerStyle())
        .padding()
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
        .cornerRadius(5)
    }
}

struct TestbedView_Previews: PreviewProvider {
    static var previews: some View {
        TestbedView()
    }
}
