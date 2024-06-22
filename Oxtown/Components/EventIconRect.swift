//
//  EventIcon.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI
import Firebase

struct EventIconRect: View {
    /*
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    */
    
    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showEvent: Bool = false
    
    var event: Event
    
    var body: some View {
        HStack {
            VStack {
                Spacer().frame(height: 8.0)
                HStack{
                    HStack {
                        AsyncImage(url: URL(string: event.image)!) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                        
                        Spacer().frame(width: 20)
                        
                        VStack {
                            Text(event.title)
                                .font(.custom("Avenir", size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.center)
                            HStack {
                                Text(event.time.dateValue(), format: Date.FormatStyle().day().month())
                                Text(event.time.dateValue(), format: Date.FormatStyle().hour().minute())
                            }
                                .font(.custom("Avenir", size: 12))
                                .fontWeight(.light)
                                .foregroundStyle(Color.black)
                                .frame(alignment: .leading)
                        }
                        .frame(width: 160, height: 100)
                    }
                    .onTapGesture{ withAnimation {showEvent.toggle()} }
                    
                    VStack(alignment: .trailing) {
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
                        
                        Spacer().frame(height: 50)
                        
                        Menu {
                            if eventAdded {
                                Button {
                                    eventAdded.toggle()
                                    
                                }
                                label: { Label("Remove from My Events", systemImage: "minus") }
                            } else {
                                Button {
                                    eventAdded.toggle()
                                    /*
                                    let event_added = event
                                    context.insert(event_added)
                                    try! context.save()
                                    dismiss()
                                    */
                                }
                                label: { Label("Add to My Events", systemImage: "plus") }
                            }
                            Button { showSafari.toggle() }
                            label: { Label("Website", systemImage: "globe") }
                            ShareLink(item: URL(string: event.website)!,
                                      subject: Text("Cool Event"),
                                      message: Text("Check this out!\n"))
                            { Label("Share", systemImage: "square.and.arrow.up") }
                        }
                        label: { Image(systemName: "chevron.down.circle.fill")
                                .foregroundStyle(Color.black) }

                    }
                    .frame(width: 50)
                }
                Spacer().frame(height: 8.0)
            }
            .frame(width: 360, height: 116, alignment: .top)
            .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(lineWidth: 2))
            .sheet(isPresented: $showSafari) {
                SFSafariViewWrapper(url: URL(string: event.website)!)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $showEvent) {
                EventView(event: event)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct EventIconRect_Preview: PreviewProvider {
    
    static var previews: some View {
        @StateObject var eventManager = EventManager()

        ZStack{
            Color.lakeBlue.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 10) {
                    EventIconRect(event: Event(id: "000001",
                                           image: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.l3ZBUiwYCIucnlN3PnYxMQHaEo%26pid%3DApi&f=1&ipt=f80005eb221faee40b00c9dedba80a882137d2a48098c00b04ec26396878e25a&ipo=images",
                                           title: "Pokemon Day",
                                           time: Timestamp(),
                                           address: "Tokyo",
                                           location: GeoPoint(latitude: 0, longitude: 0),
                                           details: "Gonna be fun!",
                                           website: "https://bulbapedia.bulbagarden.net/wiki/Pokémon_Battrio",
                                           hostID: ["Pokemon"]
                                          )
                    )
                    
                    EventIconRect(event: Event(id: "Ln7VkWOJ6YbgeDmM1qNo",
                                           image: "https://firebasestorage.googleapis.com/v0/b/oxtown-dyjl.appspot.com/o/pembroke_comm_ball_2024.png?alt=media&token=45410515-9e63-44d5-ada3-96d52e63d564",
                                           title: "Pembroke College Ball 2024",
                                           time: Timestamp(),
                                           address:
                                            "Pembroke College, St. Aldate's, Oxford, OX1 1DW",
                                           location: GeoPoint(latitude: 51.750295, longitude: 1.258935),
                                           details: "For the first time in 5 years, we invite you to embark on a journey interwoven with the threads of fantasy, each step revealing a new page of adventure. Dust off your cloaks, fasten your white bow ties, and adorn your finest attire as we traverse four centuries across all four quads. Our college grounds await…",
                                           website: "https://bookoxex.com/Go/PembrokeCollegeCommemorationBall2024",
                                           hostID: ["BrT7azkW6vWZh6DOIHtd"]
                                          )
                    )
                }
            }
        }
    }
}
