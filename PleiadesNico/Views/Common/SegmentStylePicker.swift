//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct SegmentStylePicker: View {
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
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: selected, perform: onChangeClosure)
    }
}

extension SegmentStylePicker {

    fileprivate func currentSelectionView() -> some View {
        let selectedOption = options[selected] ?? "???"
        
        return Text(selectedOption)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .padding(3)
    }
}

struct SegmentStylePicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentStylePicker(
            options: [0:"zero", 1:"one", 2:"two", 3:"three", 4:"four", 5:"five"],
            onChangeClosure: {index in print(index)},
            selected: 0
        )
    }
}
