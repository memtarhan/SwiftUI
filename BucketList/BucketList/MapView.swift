//
//  MapView.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import MapKit
import SwiftUI

struct MLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))

    @State private var locations = [
        MLocation(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.5001, longitude: -0.141)),
        MLocation(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    ]

    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 24, height: 24)
                                .onTapGesture {
                                    print("Tapped on \(location.name)")
                                }
//                            Text(location.name)
                        }
                    }
                }

//                Button("Add") {
////                    locations.append(Location(name: "Camden", coordinate: CLLocationCoordinate2D(latitude: 51.5001, longitude: -0.086)))
//                }
            }
            .navigationTitle("London Explorer")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
