//
//  DetailView.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI
import FittedSheets
import SDWebImageSwiftUI

struct DetailView: View {

    @ObservedObject var presenter: DetailPresenter
    
    
    var body: some View {
        VStack{
            MapView(latitude: presenter.place.latitude, longitude: presenter.place.longitude)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage(image: WebImage(url: URL(string: presenter.place.image)))
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading ){
                HStack {
                    Text(presenter.place.name)
                        .font(.title)
                    
                    Button(action: {
                            self.presenter.updateFavoritePlace()
                        
                    },
                    label: {
                        presenter.place.isFavorite ?
                            Image(systemName: "heart.fill"):
                            Image(systemName: "heart")
                        
                    }).buttonStyle(CircleBackButtonStyle())
                }
                HStack(alignment: .top) {
                    Text(presenter.place.address)
                        .font(.subheadline)
                    Spacer()
                }
                
                ScrollView(.vertical){
                    Text(presenter.place.description)
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello detail")
    }
}
