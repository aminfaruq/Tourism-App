//
//  CircleImage.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircleImage: View {
    var image: WebImage

    var body: some View {
        image
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
            .shadow(radius: 10))
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: WebImage(url: URL(string: "https://images.unsplash.com/photo-1505993597083-3bd19fb75e57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80")))
    }
}
