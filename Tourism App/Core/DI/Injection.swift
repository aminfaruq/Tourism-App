//
//  Injection.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import RealmSwift

final class Injection : NSObject {
    
    private func provideRepository() -> TourismRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return TourismRepository.sharedInstance(locale, remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideDetail(place : PlacesModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, place: place)
    }
    
    func provideFavorite() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    
}
