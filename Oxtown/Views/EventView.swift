//
//  EventView.swift
//  Oxtown
//
//  Created by John Lee on 25/5/24.
//

import SwiftUI
import Firebase
import MapKit
import CachedAsyncImage

struct EventView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventhostManager: EventHostManager

    @State private var eventAdded: Bool = false
    @State private var showSafari: Bool = false
    
    var event: Event
    
    var body: some View {
        
        ZStack {
            ScrollView {
                Spacer().frame(height: 30)
                
                CachedAsyncImage(url: URL(string: event.image)!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(lineWidth: 1.5))

                Text(event.title)
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.bold)
                
                Divider()
                
                Text("About")
                    .font(.custom("Avenir", size: 22))
                    .fontWeight(.bold)
                Text(event.details.isEmpty ? "No descriptions" : event.details.replacingOccurrences(of: "\\n", with: "\n"))
                    .font(.custom("Avenir", size: 16))
                    .multilineTextAlignment(.leading)
                    .padding([.horizontal, .bottom])
                
                Spacer()
                
                Text("Organizer")
                    .font(.custom("Avenir", size: 22))
                    .fontWeight(.bold)
                
                ForEach(event.hostID, id: \.self) {
                    h in
                    let eventhost: EventHost = eventhostManager.eventhosts[h]!
                    HStack {
                        Spacer().frame(width: 5)
                        CachedAsyncImage(url: URL(string: eventhost.image)!) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 120)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(lineWidth: 1))
                        
                        Spacer().frame(width: 15)
                        
                        Text(eventhost.name)
                            .font(.custom("Avenir", size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .frame(width: 180)
                    }
                    .frame(width: 320, height: 130)
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(lineWidth: 2))
                    .onTapGesture { showSafari.toggle() }
                    .sheet(isPresented: $showSafari) {
                        SFSafariViewWrapper(url: URL(string: eventhost.website)!)
                            .ignoresSafeArea()
                    }
                }
                
                Text("Venue")
                    .font(.custom("Avenir", size: 22))
                    .fontWeight(.bold)
                let eventLat = event.location!.latitude
                let eventLong = event.location!.longitude
                let location2d = CLLocationCoordinate2D(latitude: eventLat, longitude: eventLong)
                let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.03)
                let region = MKCoordinateRegion(center: location2d, span: span)
                let bounds = MapCameraBounds(centerCoordinateBounds: region)
                Map(initialPosition: .region(region), bounds: bounds) {
                    Marker(event.title, coordinate: location2d)
                }
                .frame(width: 350, height: 250)
                .mask(RoundedRectangle(cornerRadius: 40))
                .onTapGesture {
                    let mapItem: MKMapItem = MKMapItem(placemark: MKPlacemark(coordinate: location2d))
                    mapItem.name = event.title
                    mapItem.openInMaps()
                }
            }
            .scrollIndicators(.hidden)
            
            Button (action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(5)
            
        }
        
            //VStack(alignment: .trailing) {
                /*
                Text(event.available ? (event.free ? "Free" : "Paid") : (event.free ? "Full" : "Sold"))
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 60, height: 30)
                    .background(event.available ? (event.free ? .pastelGreen : .maroon) : .pastelPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                 */

    }
}
