//
//  RemoteDataSource.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: class {
    func getPlaces() -> AnyPublisher<[PlacesResponse] , Error>
}

final class RemoteDataSource : NSObject {
    private override init() { }
    
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
}

extension RemoteDataSource : RemoteDataSourceProtocol {
    func getPlaces() -> AnyPublisher<[PlacesResponse], Error> {
        return Future<[PlacesResponse] , Error> { completion in
            if let url = URL(string: Endpoints.Gets.list.url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: TourismResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.places))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }
        .eraseToAnyPublisher()
    }
    
}

