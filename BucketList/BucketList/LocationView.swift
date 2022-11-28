//
//  LocationView.swift
//  BucketList
//
//  Created by Mehmet Tarhan on 21/11/2022.
//

import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))

    @Published var locations = [Location]()

    func addNewLocation() {
        let location = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
        DispatchQueue.main.async {
            self.locations.append(location)
        }
    }
}

struct LocationView: View {
    @ObservedObject private var viewModel = LocationViewModel()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())

                        Text(location.name)
                    }
                }
            }
            .ignoresSafeArea()

            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)

            VStack {
                Spacer()

                HStack {
                    Spacer()

                    Button {
                        viewModel.addNewLocation()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
