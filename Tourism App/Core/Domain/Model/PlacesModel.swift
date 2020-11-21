//
//  PlacesModel.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation

struct PlacesModel : Equatable , Identifiable {
    let id: Int
    let name: String
    let description: String
    let address: String
    let longitude : Double
    let latitude : Double
    let like : Int
    let image: String
    var isFavorite : Bool 
}
