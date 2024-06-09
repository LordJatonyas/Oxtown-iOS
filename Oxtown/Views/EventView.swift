//
//  EventView.swift
//  Oxtown
//
//  Created by John Lee on 25/5/24.
//

import SwiftUI
import Firebase

struct EventView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var screenWidth = UIScreen.main.bounds.size.width
    @State private var screenHeight = UIScreen.main.bounds.size.height

    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showFullEvent: Bool = false
    
    var event: Event
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: event.image)!) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ZStack {
                        Image(systemName: "photo")
                            .imageScale(.large)
                        ProgressView() }}
                .frame(width: 360, height: 250)
                .mask(RoundedRectangle(cornerRadius: 50))
                .padding()
                
                Text(event.title)
                    .font(.custom("Avenir", size: 26))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                
                Divider()
            
                TabView {
                    VStack {
                        Text("About")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.bold)
                        ScrollView {
                            Text(event.details.isEmpty ? "No descriptions" : event.details.replacingOccurrences(of: "\\n", with: "\n"))
                                .font(.custom("Avenir", size: 16))
                                .multilineTextAlignment(.leading)
                        }
                        .scrollIndicators(.hidden)
                        
                        Spacer()
                    }.tag(0)
                    
                    VStack {
                        Text("Hi")
                    }.tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .onAppear {
                    setupAppearance()
                }
            }
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.black)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
        }
        .background(.sand)
        .mask(RoundedRectangle(cornerRadius: 20))
        .ignoresSafeArea()
        
            
            
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
                
                

        /*
        if showFullEvent {
            Rectangle().frame(width: 330, height: 100)
            Text(event.details.isEmpty ? "No descriptions" : event.details.replacingOccurrences(of: "\\n", with: "\n"))
                .font(.custom("Avenir", size: 14))
                .multilineTextAlignment(.leading)
                .padding()
        }
        Spacer()
         */
    }
    
    // Support gestures
    /*
     .onTapGesture{openURL(URL(string: event.website)!)}
     .onLongPressGesture(minimumDuration: 0.3) {
     UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
     }
     */
    
    func setupAppearance() {
          UIPageControl.appearance().currentPageIndicatorTintColor = .bgPurple
          UIPageControl.appearance().pageIndicatorTintColor = UIColor.green.withAlphaComponent(0.3)
        }
}


struct FullEventView_Preview: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            Color.lakeBlue.ignoresSafeArea()
            EventView(event: Event(id: "000001",
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
        }
    }
}
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
