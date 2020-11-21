//
//  LocaleDataSource.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol : class {
    func getPlaces() -> AnyPublisher<[PlacesEntity], Error>
    func addPlaces(from places: [PlacesEntity]) -> AnyPublisher<Bool , Error>
    func updatePlaces(by idPlace: Int) -> AnyPublisher<PlacesEntity , Error>
    func getFavoritePlace() -> AnyPublisher<[PlacesEntity], Error>
}

final class LocaleDataSource: NSObject {
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    
    
    func addPlaces(from places: [PlacesEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool , Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for places in places {
                            realm.add(places , update: .all)
                        }
                        completion(.success(true))
                    }
                }catch {
                    completion(.failure(DatabaseError.invalidInstance))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func updatePlaces(by idPlace: Int) -> AnyPublisher<PlacesEntity, Error> {
        return Future<PlacesEntity , Error> { completion in
            if let realm = self.realm , let placeEntity = {
                realm.objects(PlacesEntity.self).filter("id = \(idPlace)")
            }().first {
                do {
                    try realm.write {
                        placeEntity.setValue(!placeEntity.isFavorite, forKey: "isFavorite")
                    }
                    completion(.success(placeEntity))
                }catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoritePlace() -> AnyPublisher<[PlacesEntity], Error> {
        return Future<[PlacesEntity], Error> { completion in
            
            guard let realmstorage = self.realm else {
                return  completion(.failure(DatabaseError.invalidInstance))
            }
            
            let placeEntities = {
                realmstorage.objects(PlacesEntity.self)
                    .filter("isFavorite = \(true)")
                    .sorted(byKeyPath: "id", ascending: true)
            }()
            completion(.success(placeEntities.toArray(ofType: PlacesEntity.self)))
        }.eraseToAnyPublisher()
    }
    
    func getPlaces() -> AnyPublisher<[PlacesEntity], Error> {
        return Future<[PlacesEntity] , Error> { completion in
            if let realm = self.realm {
                let places : Results<PlacesEntity> = {
                    realm.objects(PlacesEntity.self)
                }()
                
                var favoritePlace = [PlacesEntity]()
                for items in places {
                    favoritePlace.append(items)
                }
                completion(.success(favoritePlace))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
}


extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
