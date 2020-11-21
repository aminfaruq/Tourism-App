//
//  MapView.swift
//  Tourism App
//
//  Created by Amin faruq on 02/11/20.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var latitude: Double
    var longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        uiView.setRegion(region, animated: true)
        uiView.overrideUserInterfaceStyle = .light
        uiView.mapType = .mutedStandard
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: -8.7415482, longitude: 121.791432)
    }
}
