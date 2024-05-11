//
//  EventIcon.swift
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct EventIcon: View {
    @Environment(\.openURL) var openURL
    
    @State var eventAdded: Bool = false
    
    var event: Event
    
    var body: some View {
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
                    .frame(maxWidth: 200, alignment: .center)
                Spacer()
                    .frame(height: 5)
                Text(event.start_time)
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.light)
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
                } else {
                    Text("~" + String(event.distance) + "km")
                        .font(.system(size: 13))
                        .fontWeight(.light)
                }
            }
            .frame(maxWidth: 50)
            Spacer()
                .frame(maxWidth: 20)
        }
        .frame(width: 360, height: 120)
        .background(.sand.opacity(0.7))
        .cornerRadius(20.0)
        .contextMenu {
            Button {  }
            label: { Label("About", systemImage: "line.3.horizontal")}
            if eventAdded {
                Button {
                    eventAdded.toggle()
                }
                label: { Label("Remove from My Events", systemImage: "minus") }
            } else {
                Button { eventAdded.toggle() }
                label: { Label("Add to My Events", systemImage: "plus") }
            }
            Button { openURL(URL(string: event.website)!) }
            label: { Label("Website", systemImage: "globe") }
        }
        .overlay(RoundedRectangle(cornerRadius: 20.0)
            .strokeBorder(.hardNavy.opacity(0.7), lineWidth: 1))
        //.scaleEffect(icon_scale, anchor: .center)
        
        // Support gestures
        /*
        .onTapGesture{openURL(URL(string: event.website)!)}
        .onLongPressGesture(minimumDuration: 0.3) {
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
        */
        .padding(.bottom)
        .frame(height: 125)
    }
}

#Preview {
    ZStack{
        Color.lakeBlue.ignoresSafeArea()
        VStack {
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
        }
    }
}
