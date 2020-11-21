//
//  ContentView.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI

struct BaseView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    
    
    var body: some View {
        
        let favoriteUseCase = Injection.init().provideFavorite()
        let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        
        TabView{
            HomeView(presenter: homePresenter)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            FavoriteView(presenter: favoritePresenter)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
                .environmentObject(favoritePresenter)
                .tag(1)
            
            AboutView()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
                }
                .tag(2)
        }
        .onAppear()
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
