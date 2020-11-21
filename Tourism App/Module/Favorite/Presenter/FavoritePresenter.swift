//
//  FavoritePresenter.swift
//  Tourism App
//
//  Created by Amin faruq on 22/11/20.
//

import SwiftUI
import Combine

class FavoritePresenter : ObservableObject {
    
    private let favoriteUseCase : FavoriteUseCase
    private var cancellables: Set<AnyCancellable> = []
    private let router = HomeRouter()
    
    @Published private(set) var state = LoadedStateHelper.idle
    
    @Published var places = [PlacesModel]()
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getPlaces() {
        self.state = .loading
        favoriteUseCase.getFavoritePlaces()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error)
                    
                case .finished:
                    self.state = .loaded
                }
            }, receiveValue: { result in
                if result.count == 0 {
                    self.state = .empty
                }
                self.places = result
                
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
