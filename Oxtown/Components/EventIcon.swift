//
//  EventIcon.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI
import Firebase

struct EventIcon: View {
    /*
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    */
    
    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showFullEvent: Bool = false
    
    var event: Event
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                HStack{
                    Spacer()
                        .frame(width: 9.0)
                    HStack {
                        AsyncImage(url: URL(string: event.image)!) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {}
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                        Spacer()
                            .frame(width: 20)
                        VStack {
                            Text(event.title)
                                .font(.custom("Avenir", size: 18))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .frame(maxWidth: 200, alignment: .center)
                            Spacer()
                                .frame(height: 5)
                            HStack {
                                Text(event.time.dateValue(), format: Date.FormatStyle().day().month())
                                Text(event.time.dateValue(), format: Date.FormatStyle().hour().minute())
                            }
                                .font(.custom("Avenir", size: 14))
                                .fontWeight(.light)
                                .foregroundStyle(Color.black)
                                .frame(alignment: .leading)
                        }
                        .frame(width: 160)
                    }
                    .onTapGesture{ withAnimation {showFullEvent.toggle()} }
                    
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

                        Spacer()
                            .frame(height: 50)
                        
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
                        label: { Image(systemName: "ellipsis").foregroundStyle(Color.black)
                                 Text(" ")}
                        
                    }
                    .frame(maxWidth: 50)
                    
                    Spacer()
                        .frame(maxWidth: 20)
                }

                if showFullEvent {
                    Rectangle().frame(width: 330, height: 1)
                    Text(event.details.isEmpty ? "No descriptions" : event.details.replacingOccurrences(of: "\\n", with: "\n"))
                        .font(.custom("Avenir", size: 14))
                        .multilineTextAlignment(.leading)
                        .padding()
                }
                Spacer()
            }
            .frame(width: 360, alignment: .top)
            .background(.sand.opacity(0.7))
            .cornerRadius(20.0)
            
            // Support gestures
            /*
             .onTapGesture{openURL(URL(string: event.website)!)}
             .onLongPressGesture(minimumDuration: 0.3) {
             UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
             }
             */
            .popover(isPresented: $showSafari) {
                SFSafariViewWrapper(url: URL(string: event.website)!)
                    .ignoresSafeArea()
            }
        }
    }
}

struct EventIcon_Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            Color.lakeBlue.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 10) {
                    
                    EventIcon(event: Event(id: "000001",
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
                    
                    /*
                     EventIcon(event: Event(image: "OUAPS_Ball",
                     title: "OUAPS Ball 2024",
                     start_time: "10 May 8PM",
                     details: "",
                     free: false,
                     available: true,
                     website: "https://bookoxex.com/Go/OUAPSBall2024"
                     )
                     )
                     
                     EventIcon(event: Event(image: "Keble_Ball",
                     title: "Keble College Ball",
                     start_time: "11 May 7PM",
                     details: "",
                     free: false,
                     available: false,
                     website: "https://linktr.ee/kebleball2024"
                     )
                     )
                     
                     EventIcon(event: Event(image: "HubxCrankstart",
                     title: "Oxford Hub x Crankstart Gala",
                     start_time:"17 May 1900H",
                     details: "",
                     free: false,
                     available: false,
                     website: "https://bookoxex.com/Go/OxfordHubxCrankstartCharityGala"
                     )
                     )
                     
                     EventIcon(event: Event(image: "OU_Ball",
                     title: "Oxford Union Ball",
                     start_time:"17 May 1900H",
                     details: "",
                     free: false,
                     available: true,
                     website: "https://bookoxex.com/Go/OxfordUnionBallAMidsummerNight"
                     )
                     )
                     */
                }
            }
        }
    }
}
