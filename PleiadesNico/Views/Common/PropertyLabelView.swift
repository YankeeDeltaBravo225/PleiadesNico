//
//  VideoPropertyIView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/07.
//

import SwiftUI

struct PropertyLabelView: View {
    let symbol : String
    let text   : String
    let size   : CGFloat

    var body: some View {
        HStack{
            Image(systemName: symbol)
                .resizable()
//                .foregroundColor(.white)
                .frame(width:size, height:size)
            Text(text)
                .font(.system(size: size))
//                .foregroundColor(.white)
//                .shadow(color: .black, radius: 2)
            Spacer()
        }
    }
}

struct VideoPropertyIView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyLabelView(symbol:"text.bubble", text:"Sample", size:24)
    }
}
