//
//  EventView.swift
//  Oxtown
//
//  Created by John Lee on 25/5/24.
//

import SwiftUI
import Firebase
import MapKit

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
                        AsyncImage(url: URL(string: eventhost.image)!) { image in
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
                Map(initialPosition: .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: event.location!.latitude, longitude: event.location!.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))) {
                    Marker(event.title, coordinate: CLLocationCoordinate2D(latitude: event.location!.latitude, longitude: event.location!.longitude)
                    )
                }
                .frame(width: 350, height: 180)
                .mask(RoundedRectangle(cornerRadius: 40))
                .onTapGesture {
                    let mapItem: MKMapItem = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: event.location!.latitude, longitude: event.location!.longitude)))
                    mapItem.name = event.title
                    mapItem.openInMaps()
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            
            Button (action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            
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
