//
//  EventView.swift
//  Oxtown
//
//  Created by John Lee on 25/5/24.
//

import SwiftUI

import SwiftUI
import Firebase

struct FullEventView: View {
    /*
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    */
    @Namespace var namespace
    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showFullEvent: Bool = false
    
    var event: Event
    
    var body: some View {
        ZStack {
            if !showFullEvent {
                
                VStack(alignment: .leading, spacing: 12) {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.custom("Avenir", size: 30))
                            .fontWeight(.bold)
                        HStack {
                            Text(event.time.dateValue(), format: Date.FormatStyle().day().month())
                                .font(.custom("Avenir", size: 20))
                                .fontWeight(.semibold)
                            Text(event.time.dateValue(), format: Date.FormatStyle().hour().minute())
                                .font(.custom("Avenir", size: 20))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(20)
                    .foregroundStyle(.white)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .blur(radius: 30)
                    )
                }
                .padding(20)
                .background(
                    AsyncImage(url: URL(string: event.image)!) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: { ProgressView() }
                        .frame(width: 370, height: 180)
                        .cornerRadius(20)
                        
                )
                
                .onTapGesture {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) { showFullEvent.toggle() }
                }
                
            } else {
                ScrollView(showsIndicators: false) {
                    
                }
                    .popover(isPresented: $showSafari) {
                    SFSafariViewWrapper(url: URL(string: event.website)!)
                        .ignoresSafeArea()
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) { showFullEvent.toggle() }
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
