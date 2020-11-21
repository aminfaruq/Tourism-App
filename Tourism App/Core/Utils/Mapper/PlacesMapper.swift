//
//  PlacesMapper.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

final class PlacesMapper{
    
    static func mapPlacesResponseToEntities(
        input placesResponses: [PlacesResponse]
    ) -> [PlacesEntity] {
        return placesResponses.map { result in
            let newPlaces = PlacesEntity()
            newPlaces.id = result.id ?? 0
            newPlaces.name = result.name ?? "Unknown"
            newPlaces.desc = result.description ?? "Unknown"
            newPlaces.address = result.address ?? "Unknown"
            newPlaces.longitude = result.longitude ?? 0.0
            newPlaces.latitude = result.latitude ?? 0.0
            newPlaces.like = result.like ?? 0
            newPlaces.image = result.image ?? "Unknown"
            newPlaces.isFavorite = false
            return newPlaces
        }
    }
    
    static func mapPlacesEntitiesToDomains(
        input placesEntities : [PlacesEntity]
    ) -> [PlacesModel] {
        return placesEntities.map { result in
            return PlacesModel(
                id: result.id,
                name: result.name,
                description: result.desc,
                address: result.address,
                longitude: result.longitude,
                latitude: result.latitude,
                like: result.like,
                image: result.image,
                isFavorite: result.isFavorite
            )
        }
    }
    
    static func mapPlaceEntityToDomain(
        input placeEntity : PlacesEntity
    ) -> PlacesModel{
        return PlacesModel(
            id: placeEntity.id,
            name: placeEntity.name,
            description: placeEntity.desc,
            address: placeEntity.address,
            longitude: placeEntity.longitude,
            latitude: placeEntity.latitude,
            like: placeEntity.like,
            image: placeEntity.image,
            isFavorite: placeEntity.isFavorite)
    }
    
    
    static func mapPlaceDomainToEntity(
        input placeDomain : PlacesModel
    ) -> PlacesEntity{
        let newPlaces = PlacesEntity()
        newPlaces.id = placeDomain.id
        newPlaces.name = placeDomain.name
        newPlaces.desc = placeDomain.description
        newPlaces.address = placeDomain.address
        newPlaces.longitude = placeDomain.longitude
        newPlaces.latitude = placeDomain.latitude
        newPlaces.like = placeDomain.like
        newPlaces.image = placeDomain.image
        newPlaces.isFavorite = placeDomain.isFavorite
        return newPlaces
    }
    
    static func mapPlacesDomainsToEntity(
        input placesModel : [PlacesModel]
    ) -> [PlacesEntity]{
        return placesModel.map { result in
            let newPlaces = PlacesEntity()
            newPlaces.id = result.id
            newPlaces.name = result.name
            newPlaces.desc = result.description
            newPlaces.address = result.address
            newPlaces.longitude = result.longitude
            newPlaces.latitude = result.latitude
            newPlaces.like = result.like
            newPlaces.image = result.image
            newPlaces.isFavorite = result.isFavorite
            return newPlaces
            
        }
    }
    
    
    static func mapCategoryResponsesToDomains(
        input placesResponses : [PlacesResponse]
    ) -> [PlacesModel] {
        return placesResponses.map { result in
            return PlacesModel(
                id: result.id ?? 0,
                name: result.name ?? "",
                description: result.description ?? "Unknown",
                address: result.address ?? "Unknown",
                longitude: result.longitude ?? 0.0,
                latitude: result.latitude ?? 0.0,
                like: result.like ?? 0,
                image: result.image ?? "Unknown" ,
                isFavorite: false)
        }
    }
}
