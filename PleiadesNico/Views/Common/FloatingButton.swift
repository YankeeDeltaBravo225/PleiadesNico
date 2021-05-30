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
    let color1     : Color
    let color2     : Color

    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing)

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
            .background( gradient )
            .cornerRadius(20.0)
            .shadow(color: .gray, radius: 3, x: 3, y: 3)
            .padding(3)
    }
}


struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: {}, systemIcon: "safari", text: "OK", color1: .blue, color2: .purple)
    }
}
