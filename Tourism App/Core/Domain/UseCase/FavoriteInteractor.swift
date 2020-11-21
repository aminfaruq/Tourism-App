//
//  FavoriteInteractor.swift
//  Tourism App
//
//  Created by Amin faruq on 22/11/20.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    func getFavoritePlaces() -> AnyPublisher<[PlacesModel], Error>
}

class FavoriteInteractor : FavoriteUseCase {
    
    private let repository: TourismRepositoryProtocol

    required init(repository: TourismRepositoryProtocol) {
      self.repository = repository
    }

    func getFavoritePlaces() -> AnyPublisher<[PlacesModel], Error> {
        return repository.getFavoritePlace()
    }
    
}
