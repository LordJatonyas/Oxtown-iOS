//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct ExploreEventsView: View {
    
    @State var events = [
        
        Event(image: "OUAPS_Ball",
              title: "OUAPS Ball 2024",
              start_time: "10 May 2000H",
              distance: 0,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/OUAPSBall2024"
             ),
        
        Event(image: "Keble_Ball",
              title: "Keble College Ball",
              start_time: "11 May 1900H",
              distance: 3,
              free: false,
              available: false,
              website: "https://linktr.ee/kebleball2024"
             ),
        
        Event(image: "OUMDC",
              title: "Karting Cuppers 2024",
              start_time: "14 May 1925H",
              distance: 3,
              free: false,
              available: true,
              website: "https://www.eventbrite.co.uk/e/891051798917?aff=oddtdtcreator"
             ),

        Event(image: "ArabSoc_Ball",
              title: "ArabSoc Ball",
              start_time: "14 May 1945H",
              distance: 1,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/ThroughTheOliveGrovesArabSocBall"
             ),
        
        Event(image: "HubxCrankstart",
              title: "Oxford Hub x Crankstart Gala",
              start_time:"17 May 1900H",
              distance: 1,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/OxfordHubxCrankstartCharityGala"
             ),
        
        Event(image: "OU_Ball",
              title: "Oxford Union Ball",
              start_time:"17 May 1900H",
              distance: 1,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/OxfordUnionBallAMidsummerNight"
             ),
        
        Event(image: "PPH_Ball",
              title: "Dodo Disco: 3rd Annual PPH Ball",
              start_time:"25 May 2000H",
              distance: 3,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/ThePermanentPrivateHallsBall"
             ),
        
        Event(image: "RPC_Ball",
              title: "RPC Final Fling 2024",
              start_time:"08 Jun 1900H",
              distance: 1,
              free: false,
              available: false,
              website: "https://bookoxex.com/Go/RPCFinalFling2024"
             ),
        
        Event(image: "Univ_Ball",
              title: "University College Ball 2024",
              start_time:"21 Jun 1900H",
              distance: 2,
              free: false,
              available: false,
              website: "https://bookoxex.com/Go/UniversityCollegeBall2024"
             ),
        
        Event(image: "Pembroke_Ball",
              title: "Pembroke College Ball 2024",
              start_time:"21 Jun 1900H",
              distance: 2,
              free: false,
              available: false,
              website: "https://bookoxex.com/Go/PembrokeCollegeCommemorationBall2024"
             ),
        
        Event(image: "Garden_Party",
              title: "Balliol Garden Party 2024",
              start_time:"22 Jun 1730H",
              distance: 5,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/GardenParty2024"
             ),
        
        Event(image: "LLMxLaw",
              title: "LLM X Law Hackathon",
              start_time:"23 Jun 0800H",
              distance: 145,
              free: true,
              available: true,
              website: "https://hackthelaw-cambridge.com"
             ),
        
        Event(image: "GTC_Ball",
              title: "GTC Ball 2024",
              start_time:"28 Jun 2000H",
              distance: 2,
              free: false,
              available: true,
              website: "https://bookoxex.com/Go/GTCBall2024"
             ),
        
    ]
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Spacer()
            LazyVStack(spacing: 10) {
                ForEach(events) {
                    event in EventIcon(event: event)
                        .environment(\.colorScheme, .light)
                }
            }
        }
    
        /*
        .gesture(DragGesture()
            .onEnded({value in
                let horizontalSwipe = value.translation.width
                if horizontalSwipe > 0 {
                    isSidebarOpened.toggle()
                }
            }))
        */
    }
}



#Preview {
    ExploreEventsView()
}
