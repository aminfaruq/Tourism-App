//
//  TourismResponse.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation

struct TourismResponse : Decodable {
    let places : [PlacesResponse]
}

struct PlacesResponse : Decodable{
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case address = "address"
        case longitude = "longitude"
        case latitude = "latitude"
        case like = "like"
        case image = "image"
    }
    
    let id: Int?
    let name: String?
    let description: String?
    let address: String?
    let longitude : Double?
    let latitude : Double?
    let like : Int?
    let image: String?
    
}
