//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct MenuStylePicker: View {
    
    typealias OnChanged = (_ index : Int) -> Void

    let options         : [String]
    let onChangeClosure : OnChanged

    @State var selected: Int


    var body: some View {
        Picker( selection: $selected, label: currentSelectionView() ) {
            ForEach(options.indices, id: \.self) { index in
                Text(options[index]).tag(index)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .onChange(of: selected, perform: onChangeClosure)
    }

}


extension MenuStylePicker {
    fileprivate func currentSelectionView() -> some View {
        return Text(options[selected])
            .foregroundColor(.white)
            .padding(10)
            .background(Color.blue)
            .cornerRadius(20.0)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .padding(3)
    }
}


struct MenuStylePicker_Previews: PreviewProvider {
    static var previews: some View {
        MenuStylePicker(
            options: ["one", "two", "three", "four", "five"],
            onChangeClosure: {index in print(index)},
            selected: 0
        )
    }
}