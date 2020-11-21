//
//  PlacesRow.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlacesRow: View {
    
    var places : PlacesModel
    
    var body: some View {
        VStack {
            imagePlaces
            content
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 250)
        .background(
            WebImage(url: URL(string: places.image))
                .blur(radius: 30)
            
        )
        .cornerRadius(30)
    }
}


extension PlacesRow{
    var imagePlaces: some View {
        WebImage(url: URL(string: places.image))
            .resizable()
            .indicator(.activity)
            .clipShape(Circle())
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 200)
            .cornerRadius(30)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 4)
            .shadow(radius: 10))
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(places.name)
                .font(.title)
                .foregroundColor(.white)
                .bold()
            
            Text(places.description)
                .font(.system(size: 14))
                .foregroundColor(.white)

                .lineLimit(2)
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 16,
                trailing: 16
            )
        )
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        let place = PlacesModel(id: 1, name: "TN Kelimutu", description: "Taman Nasional Kelimutu terletak di Flores, Indonesia. Taman nasional ini terdiri dari bukit-bukit dan gunung-gunung dengan Gunung Kelibara (1.731 m) sebagai puncak tertinggi. Gunung Kelimutu, terdapat danau Danau tiga warna yang juga merupakan tempat dari Taman Nasional Kelimutu.\n\nDi dalam Taman Nasional Kelimutu, terdapat arboretum, hutan kecil seluas 4,5 hektare yang mewakili koleksi keanekaragaman flora di daerah tersebut. Di sana terdapat 78 jenis pohon yang dikelompokkan ke dalam 36 suku. Beberapa koleksi flora yang merupakan endemik Kelimutu adalah uta onga (Begonia kelimutuensis), turuwara (Rhododendron renschianum), dan arngoni (Vaccinium varingiaefolium).", address: "Detusoko, Kabupaten Ende, NTT", longitude: 121.791432, latitude: -8.7415482, like: 100, image: "https://images.unsplash.com/photo-1505993597083-3bd19fb75e57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80" , isFavorite: false)
        PlacesRow(places: place)
    }
}
