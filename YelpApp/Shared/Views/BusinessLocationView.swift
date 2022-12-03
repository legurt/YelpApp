//
//  BusinessLocationView.swift
//  YelpApp (iOS)
//
//  Created by Leonid Hurtovyi on 22.11.2022.
//

import SwiftUI
import MapKit

struct BusinessLocationView: View {
    private var location: IdentifiableLocation
    @State private var mapRegion: MKCoordinateRegion
    
    public init(latitude:  Double,
                longitude: Double) {
        location =
        IdentifiableLocation(coordinate: CLLocationCoordinate2D(latitude: latitude,
                                                                longitude: longitude))
        _mapRegion =
        State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude,
                                                          longitude: longitude),
                           span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                  longitudeDelta: 0.1)))
    }
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: [location]) { location in
            MapMarker(coordinate: location.coordinate,
                               tint: Color.red)
        }
    }
}

struct BusinessLocatinView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessLocationView(latitude: MockData.coordinates.lattitude,
                             longitude: MockData.coordinates.longitude)
    }
}
