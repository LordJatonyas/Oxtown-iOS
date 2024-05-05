//
//  EventView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct EventView: View {
    @Environment(\.openURL) var openURL
    @State var tap: Bool = false
    @State var press: Bool = false
    @GestureState var press_hold = false
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
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 60, height: 30)
                            .background(.pastelGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } else {
                        Text("Paid")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 60, height: 30)
                            .background(.pastelGold)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                } else {
                    Text("Sold")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
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
        .background(.sand.opacity(0.4))
        .cornerRadius(20.0)
        .overlay(RoundedRectangle(cornerRadius: 20.0)
            .strokeBorder(.hardNavy.opacity(0.7), lineWidth: 1))
        .padding(.bottom)
        .frame(height: 125)
        .onTapGesture {
            openURL(URL(string: event.website)!)
        }
        .scaleEffect(press_hold ? 1.2 : 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.6))
        .gesture(
            LongPressGesture(minimumDuration: 0.8)
                .updating($press_hold) {
                    currentState, gestureState, transition in
                    gestureState = currentState
                })
    }
}

#Preview {
    ZStack{
        Color.sakura.ignoresSafeArea()
        VStack {
            EventView(event: Event(image: "OxNeurotech", title: "g.tec Hackathon", start_time: "27 Apr 1100H", distance: -1, free: true, available: true, website: "https://www.br41n.io/Spring-School-2024"))
                .environment(\.colorScheme, .light)
            
            EventView(event: Event(image: "HMC_Summer", title: "HMC 2024 Summer Event", start_time: "03 May 1800H", distance: 2, free: false, available: false, website: "https://bookoxex.com/Go/HMC2024SummerEvent"))
                .environment(\.colorScheme, .light)
            
            EventView(event: Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"))
                .environment(\.colorScheme, .light)
        }
    }
}
