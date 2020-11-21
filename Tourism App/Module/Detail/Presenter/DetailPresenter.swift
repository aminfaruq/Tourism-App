//
//  DetailPresenter.swift
//  Tourism App
//
//  Created by Amin faruq on 03/11/20.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var place: PlacesModel
    @Published var errorMessage : String = ""
    @Published var loadingState : Bool = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        place = detailUseCase.getPlace()
    }
    
    func updateFavoritePlace() {
        self.loadingState = true
        detailUseCase.updatePlaces()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { place in
                self.place = place
            })
            .store(in: &cancellables)
    }
    
    
}

