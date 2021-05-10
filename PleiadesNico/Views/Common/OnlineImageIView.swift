//
//  OnlineImageIView.swift
//  XML_Sample
//
//  Created by katot on 2021/04/06.
//

import SwiftUI
import SDWebImageSwiftUI

struct OnlineImageIView: View {
    
    private let _imageUrl   : URL?
    private let _imageValid : Bool
    private let _width      : CGFloat
    private let _height     : CGFloat

    init(urlText : String, width : CGFloat, height : CGFloat){
        _width  = width
        _height = height
        
        guard let url = URL(string: urlText)
        else {
            _imageUrl   = nil
            _imageValid = false
            return
        }

        _imageUrl   = url
        _imageValid = true
    }

    var body: some View {
        if _imageValid {
            webImage()
        } else {
            defaultImage()
        }
    }
}


extension OnlineImageIView {

    fileprivate func webImage() -> some View {
        return LazyHStack {
            WebImage(url: _imageUrl)
                .resizable()
                .frame(width: _width, height: _width * 0.75)
                .mask(
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width:_width, height: _height)
                )
                .frame(width:_width, height: _height)
        }
    }
    
    fileprivate func defaultImage() -> some View {
        return Image(systemName: "questionmark.square")
            .resizable()
            .frame(width: _width, height: _height * 0.72)
    }

}


struct OnlineImageIView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineImageIView(urlText: "\naaaa", width: 100, height:75)
    }
}
