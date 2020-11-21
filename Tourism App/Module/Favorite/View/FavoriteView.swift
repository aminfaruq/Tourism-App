//
//  FavoriteView.swift
//  Tourism App
//
//  Created by Amin faruq on 22/11/20.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationView {
            
            ZStack{
                
                if presenter.places.count == 0 {
                    VStack{
                        Text("Data is Empty")
                    }
                }
                
                
                switch presenter.state {
                
                case .idle, .loading :
                    VStack {
                        Text("Loading...")
                        ActivityIndicator()
                    }
                case .empty :
                    VStack {
                        Text("Loading...")
                        ActivityIndicator()
                    }
                case .error(let error):
                    Text("Error \(error.localizedDescription)")
                case .loaded:
                    content
                }
                
            }.onAppear{
                self.presenter.getPlaces()
            }.navigationBarTitle(
                Text("Favorite Place"),
                displayMode: .automatic
            )
            
        }
        
    }
}

extension FavoriteView {
    
    var content : some View {
        ScrollView(.vertical , showsIndicators : false){
            ForEach(self.presenter.places , id: \.id){ places in
                self.presenter.linkBuilder(for: places){
                    PlacesRow(places: places)
                }
                
            }
        }.padding(8)
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let favoriteUseCase = Injection.init().provideFavorite()
        let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        FavoriteView(presenter: favoritePresenter)
    }
}
