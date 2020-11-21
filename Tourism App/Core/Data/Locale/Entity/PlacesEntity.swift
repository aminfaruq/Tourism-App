//
//  PlacesEntity.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import Foundation
import RealmSwift

class PlacesEntity: Object {
    
    @objc dynamic var  id: Int = 0
    @objc dynamic var  name: String = ""
    @objc dynamic var  desc: String = ""
    @objc dynamic var  address: String = ""
    @objc dynamic var  longitude : Double = 0.0
    @objc dynamic var  latitude : Double = 0.0
    @objc dynamic var  like : Int = 0
    @objc dynamic var  image: String = ""
    @objc dynamic var  isFavorite : Bool = false
    
    override static func primaryKey() -> String? {
      return "id"
    }
    
}
