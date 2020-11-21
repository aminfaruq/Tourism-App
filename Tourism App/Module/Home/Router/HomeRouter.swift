//
//  HomeRouter.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI

class HomeRouter {
    
    func makeDetailView(for place: PlacesModel) -> some View {
      let detailUseCase = Injection.init().provideDetail(place: place)
      let presenter = DetailPresenter(detailUseCase: detailUseCase)
      return DetailView(presenter: presenter)
    }
}
