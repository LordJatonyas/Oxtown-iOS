//
//  EventIcon.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct EventIcon: View {
    
    @State var eventAdded: Bool = false
    @State private var showSafari: Bool = false
    @State private var showDescription: Bool = false
    
    var event: Event
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                HStack{
                    Spacer()
                        .frame(width: 9.0)
                    Image(event.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
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
                        Text(event.start_time)
                            .font(.custom("Avenir", size: 14))
                            .fontWeight(.light)
                            .foregroundStyle(Color.black)
                            .frame(alignment: .leading)
                    }
                    .frame(width: 160)
                    
                    VStack(alignment: .trailing) {
                        if event.available {
                            if event.free {
                                Text("Free")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .frame(width: 60, height: 30)
                                    .background(.pastelGreen)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else {
                                Text("Paid")
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .padding()
                                    .frame(width: 60, height: 30)
                                    .background(.pastelGold)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        } else {
                            Text("Sold")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 60, height: 30)
                                .background(.pastelPurple)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        Spacer()
                            .frame(maxHeight: 55)
                        
                        if event.distance == -1 {
                            Text("-")
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .foregroundStyle(Color.black)
                        } else {
                            Text("~" + String(event.distance) + "km")
                                .font(.system(size: 13))
                                .fontWeight(.light)
                                .foregroundStyle(Color.black)
                        }
                    }
                    .frame(maxWidth: 50)
                    
                    Spacer()
                        .frame(maxWidth: 20)
                }

                if showDescription {
                    Rectangle().frame(width: 330, height: 1)
                    Text(" Description goes here! ")
                        .padding(.bottom)
                }
                Spacer()
            }
            .frame(width: 360, alignment: .top)
            .background(.sand.opacity(0.7))
            .cornerRadius(20.0)
            .contextMenu {
                if eventAdded {
                    Button {
                        eventAdded.toggle()
                    }
                    label: { Label("Remove from My Events", systemImage: "minus") }
                } else {
                    Button {
                        eventAdded.toggle()
                        my_events.append(event)
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
            .onTapGesture { withAnimation { showDescription.toggle() } }
            
            // Support gestures
            /*
             .onTapGesture{openURL(URL(string: event.website)!)}
             .onLongPressGesture(minimumDuration: 0.3) {
             UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
             }
             */
            .fullScreenCover(isPresented: $showSafari, content: {
                SFSafariViewWrapper(url: URL(string: event.website)!)
                .ignoresSafeArea()})
        }
    }
}

#Preview {
    ZStack{
        Color.lakeBlue.ignoresSafeArea()
        ScrollView {
            LazyVStack(spacing: 10) {
                EventIcon(event: Event(image: "OUAPS_Ball",
                                       title: "OUAPS Ball 2024",
                                       start_time: "10 May 8PM",
                                       distance: 0,
                                       free: false,
                                       available: true,
                                       website: "https://bookoxex.com/Go/OUAPSBall2024"
                                      )
                )
                
                EventIcon(event: Event(image: "Keble_Ball",
                                       title: "Keble College Ball",
                                       start_time: "11 May 7PM",
                                       distance: 3,
                                       free: false,
                                       available: false,
                                       website: "https://linktr.ee/kebleball2024"
                                      )
                )
                
                EventIcon(event: Event(image: "HubxCrankstart",
                                       title: "Oxford Hub x Crankstart Gala",
                                       start_time:"17 May 1900H",
                                       distance: 1,
                                       free: false,
                                       available: false,
                                       website: "https://bookoxex.com/Go/OxfordHubxCrankstartCharityGala"
                                      )
                )
                
                EventIcon(event: Event(image: "OU_Ball",
                                       title: "Oxford Union Ball",
                                       start_time:"17 May 1900H",
                                       distance: 1,
                                       free: false,
                                       available: true,
                                       website: "https://bookoxex.com/Go/OxfordUnionBallAMidsummerNight"
                                      )
                )
            }
        }
    }
}
