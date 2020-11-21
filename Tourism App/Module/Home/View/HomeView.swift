//
//  HomeView.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    
    var body: some View {
        NavigationView{
            ZStack{
                if presenter.loadingState{
                    VStack {
                        Text("Loading...")
                        ActivityIndicator()
                    }
                }else {
                    ScrollView(.vertical , showsIndicators : false){
                        VStack{
                            ForEach(self.presenter.places,id: \.id) { places in
                                
                                
                                self.presenter.linkBuilder(for: places) {
                                    PlacesRow(places: places)
                                }
                                
                            }
                        }.padding(8)
                    }
                }
            }.onAppear {
                if self.presenter.places.count == 0 {
                    self.presenter.getPlaces()
                }
            }.navigationBarTitle(
                Text("Tourism Apps"),
                displayMode: .automatic
            )
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, Home!")
    }
}
