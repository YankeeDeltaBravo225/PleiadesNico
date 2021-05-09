//
//  PleiadesNico
//
//  (C) 2021 Pleiades apps
//

import SwiftUI

struct FloatingButton: View {

    let action     : () -> Void
    let systemIcon : String
    let text       : String

    var body: some View {
        Button(
            action: action,
            label: {
                HStack{
                    Image(systemName: systemIcon)
                        .foregroundColor(.white)
                    Text(text)
                        .foregroundColor(.white)
                }
            }
        )
            .padding(10)
            .background(Color.purple)
            .cornerRadius(20.0)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .padding(3)
    }
}


struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: {}, systemIcon: "safari", text: "OK")
    }
}
