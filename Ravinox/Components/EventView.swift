//
//  EventView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    let image: String
    let title: String
    let start_time: String
    let end_time: String
    let distance: Int32
    var free = true
    var available = true
    var website: String
}

struct EventView: View {
    
    @Environment(\.openURL) var openURL
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
                    .fontWeight(.semibold)
                    .frame(maxWidth: 200, alignment: .center)
                Spacer()
                    .frame(height: 5)
                if event.end_time.isEmpty {
                    Text(event.start_time)
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .frame(alignment: .leading)
                } else {
                    Text(event.start_time + " -\n" + event.end_time)
                        .font(.system(size: 14))
                        .fontWeight(.light)
                        .frame(alignment: .leading)
                }
            }
            .frame(width: 160)
            VStack(alignment: .trailing) {
                if event.available {
                    if event.free {
                        Text("Free")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 60, height: 30)
                            .background(.mountainGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                        Text("Paid")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 60, height: 30)
                            .background(.goldenLeaves)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                } else {
                    Text("Sold")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 60, height: 30)
                        .background(.black)
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
        .background(
            LinearGradient(colors:[.sand.opacity(0.6),.white.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20.0)
        .overlay(RoundedRectangle(cornerRadius: 20.0)
            .stroke(.lakeBlue.opacity(0.8)))
        .onTapGesture{
            openURL(URL(string: event.website)!)
        }
        .padding(.bottom)
        .frame(height: 125)
    }
}

#Preview {
    ZStack{
        Color.goldenLeaves.ignoresSafeArea()
        VStack {
            EventView(event: Event(image: "OxNeurotech", title: "g.tec Hackathon", start_time: "27 Apr 1100H", end_time: "28 Apr 1300H", distance: -1, free: true, available: true, website: "https://www.br41n.io/Spring-School-2024"))
            
            EventView(event: Event(image: "HMC_Summer", title: "HMC 2024 Summer Event", start_time: "03 May 1800H", end_time: "04 May 0200H", distance: 2, free: false, available: false, website: "https://bookoxex.com/Go/HMC2024SummerEvent"))
            
            EventView(event: Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", end_time: "", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"))
        }
    }
}
