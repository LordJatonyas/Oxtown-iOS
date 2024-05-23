//
//  EventIcon.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct EventIcon: View {
    /*
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    */
    
    @State private var eventAdded: Bool = false
    @State private var showSafari = false
    @State private var showDescription: Bool = false
    
    var event: Event
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                HStack{
                    Spacer()
                        .frame(width: 9.0)
                    HStack {
                        //Image(event.image)
                        Image(systemName: "magnifyingglass")
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
                            Text(event.time)
                                .font(.custom("Avenir", size: 14))
                                .fontWeight(.light)
                                .foregroundStyle(Color.black)
                                .frame(alignment: .leading)
                        }
                        .frame(width: 160)
                    }
                    .onTapGesture { withAnimation { showDescription.toggle() } }
                    
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

                if showDescription {
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

#Preview {
    ZStack{
        Color.lakeBlue.ignoresSafeArea()
        ScrollView {
            LazyVStack(spacing: 10) {
                
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
