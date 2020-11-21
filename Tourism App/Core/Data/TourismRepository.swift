//
//  TourismRepository.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import Combine

protocol TourismRepositoryProtocol {
    
    func getPlaces() -> AnyPublisher<[PlacesModel] , Error>
    
    func updatePlaces(by idPlace: Int) -> AnyPublisher<PlacesModel , Error>
    
    func getFavoritePlace() -> AnyPublisher<[PlacesModel], Error>

}

final class TourismRepository : NSObject {
    
    typealias TourismInstance = (LocaleDataSource, RemoteDataSource) -> TourismRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: TourismInstance = { localeRepo, remoteRepo in
        return TourismRepository(locale: localeRepo, remote: remoteRepo)
    }
}

extension TourismRepository : TourismRepositoryProtocol{
    func getFavoritePlace() -> AnyPublisher<[PlacesModel], Error> {
        return self.locale.getFavoritePlace()
            .map{ PlacesMapper.mapPlacesEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
    
    
    func updatePlaces(by idPlace: Int) -> AnyPublisher<PlacesModel, Error> {
        return self.locale.updatePlaces(by: idPlace)
            .map{ PlacesMapper.mapPlaceEntityToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
    
    
    func getPlaces() -> AnyPublisher<[PlacesModel], Error> {
        return self.locale.getPlaces()
            .flatMap{ result -> AnyPublisher<[PlacesModel] , Error> in
                if result.isEmpty{
                    return self.remote.getPlaces()
                        .map{ PlacesMapper.mapPlacesResponseToEntities(input: $0) }
                        .flatMap{ self.locale.addPlaces(from: $0) }
                        .filter{ $0 }
                        .flatMap{ _ in self.locale.getPlaces()
                            .map{ PlacesMapper.mapPlacesEntitiesToDomains(input: $0) }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getPlaces()
                        .map{ PlacesMapper.mapPlacesEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    
}

