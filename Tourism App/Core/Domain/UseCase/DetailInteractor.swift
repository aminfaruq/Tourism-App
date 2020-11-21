//
//  DetailInteractor.swift
//  Tourism App
//
//  Created by Amin faruq on 03/11/20.
//

import Foundation
import Combine

protocol DetailUseCase {
    func getPlace() -> PlacesModel
    
    func updatePlaces() -> AnyPublisher<PlacesModel , Error>
}

class DetailInteractor : DetailUseCase {
    
   
    private let repository : TourismRepositoryProtocol
    private let place : PlacesModel
    
    required init(
        repository : TourismRepositoryProtocol ,
        place : PlacesModel
    ) {
        self.repository = repository
        self.place = place
    }
    
    func getPlace() -> PlacesModel {
        return place
    }
    
    func updatePlaces() -> AnyPublisher<PlacesModel, Error> {
        return repository.updatePlaces(by: place.id)
    }
    
    
    
}
