//
//  HomeInteractor.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import Combine

protocol HomeUseCase {
    func getPlaces() -> AnyPublisher<[PlacesModel] , Error>
}

class HomeInteractor: HomeUseCase {
    
    private let repository: TourismRepositoryProtocol
    
    required init(repository: TourismRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPlaces() -> AnyPublisher<[PlacesModel], Error> {
        return repository.getPlaces()
    }
    
}
