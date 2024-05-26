//
//  EventView.swift
//  Oxtown
//
//  Created by John Lee on 25/5/24.
//

import SwiftUI
import Firebase

struct FullEventView: View {
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
            ZStack {
                AsyncImage(url: URL(string: event.image)!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {}
                    .frame(width: 360, height: 170)
                    .cornerRadius(20)
                
                VStack{
                    Spacer()
                        .frame(width: 20)
                    Text(event.title)
                        .font(.custom("Avenir", size: 30))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: 200, alignment: .center)
                    Spacer()
                        .frame(height: 5)
                    HStack {
                        Text(event.time.dateValue(), format: Date.FormatStyle().day().month())
                        Text(event.time.dateValue(), format: Date.FormatStyle().hour().minute())
                    }
                    
                        .font(.custom("Avenir", size: 20))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(alignment: .leading)
                        
                    
                    
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

struct FullEventView_Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            Color.lakeBlue.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 10) {
                    FullEventView(event: Event(id: "000001",
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

//struct FullEventView: View {

    /*
    
    @Namespace var namespace
    @State var show = false
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 12) {
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                }
                .padding(20)
                .foregroundStyle(.white)
                .background(Color.blue
                    .matchedGeometryEffect(id: "background", in: namespace))
                .padding(20)
            } else {
                VStack {
                    Spacer()
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.footnote.weight(.semibold))
                }
                .padding(20)
                .foregroundStyle(.white)
                .background(Color.red
                    .matchedGeometryEffect(id: "background", in: namespace))
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    FullEventView()
}

*/
