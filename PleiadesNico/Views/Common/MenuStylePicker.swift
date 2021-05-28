//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct MenuStylePicker: View {
    
    typealias OnChanged = (_ index : Int) -> Void

    let options         : [Int : String]
    let onChangeClosure : OnChanged

    @State var selected: Int


    var body: some View {
        Picker( selection: $selected, label: currentSelectionView() ) {
            ForEach(options.keys.sorted(), id: \.self) { key in
                Text(options[key] ?? "?").tag(key)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selected, perform: onChangeClosure)
    }

}


extension MenuStylePicker {
    fileprivate func currentSelectionView() -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
        let selectedOption = options[selected] ?? "???"
        
        return Text(selectedOption)
            .foregroundColor(.white)
            .padding(10)
            .background( gradient )
            .cornerRadius(20.0)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .padding(3)
    }
}


struct MenuStylePicker_Previews: PreviewProvider {
    static var previews: some View {
        MenuStylePicker(
            options: [0:"zero", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five"],
            onChangeClosure: {index in print(index)},
            selected: 0
        )
    }
}
