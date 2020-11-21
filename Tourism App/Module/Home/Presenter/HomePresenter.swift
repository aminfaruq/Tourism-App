//
//  HomePresenter.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var showFavoritesOnly = false
    @Published var places: [PlacesModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getPlaces() {
        loadingState = true
        homeUseCase.getPlaces()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { places in
                self.places = places
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for place: PlacesModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: place)) { content() }
    }
}
