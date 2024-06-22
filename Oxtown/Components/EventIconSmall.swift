//
//  EventIconSmall.swift
//  Oxtown
//
//  Created by John Lee on 20/6/24.
//

import SwiftUI
import Firebase

struct EventIconSmall: View {
    /*
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    */
    
    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showEvent: Bool = false
    
    var event: Event
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: event.image)!) { image in
                image
                .resizable()
                .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .cornerRadius(20)
            
            VStack {
                Text(event.title)
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
            }.frame(height: 40)
        }
        .padding([.leading, .bottom, .trailing])
        .frame(width: 120, height: 185)
        .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(lineWidth: 2))
        .onTapGesture{ withAnimation {showEvent.toggle()} }
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

struct EventIconSmall_Preview: PreviewProvider {
    
    static var previews: some View {
        @StateObject var eventManager = EventManager()

        ZStack{
            Color.lakeBlue.ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 10) {
                    EventIconSmall(event: Event(id: "000001",
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
                    
                    EventIconSmall(event: Event(id: "Ln7VkWOJ6YbgeDmM1qNo",
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

