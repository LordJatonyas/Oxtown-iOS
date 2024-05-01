//
//  ContentView.swift
//  oxery
//
//  Created by John Lee on 30/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var events = [
        Event(image: "OxNeurotech", title: "g.tec Hackathon", start_time: "27 Apr 1100H", end_time: "28 Apr 1300H", distance: -1, free: true, available: true, website: "https://www.br41n.io/Spring-School-2024"),
        Event(image: "Physsoc", title: "Varsity Club Night", start_time: "17 Apr", end_time: "", distance: 2, free: true, available: true, website: "https://oxford-physsoc.com/latest/"),
        Event(image: "HMC_Summer", title: "HMC 2024 Summer Event", start_time: "03 May 1800H", end_time: "04 May 0200H", distance: 2, free: false, available: false, website: "https://bookoxex.com/Go/HMC2024SummerEvent"),
        Event(image: "Corpus_Christi_Ball", title: "CCC Ball 2024", start_time: "04 May 1900H", end_time: "", distance: 1, free: false, available: false, website: "https://bookoxex.com/Go/CorpusChristiCollegeBall2024"),
        Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", end_time: "", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"),
        Event(image: "Corpus_Christi_Ball", title: "CCC Ball 2024", start_time: "04 May 1900H", end_time: "", distance: 1, free: false, available: false, website: "https://bookoxex.com/Go/CorpusChristiCollegeBall2024"),
        Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", end_time: "", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"),
        Event(image: "Corpus_Christi_Ball", title: "CCC Ball 2024", start_time: "04 May 1900H", end_time: "", distance: 1, free: false, available: false, website: "https://bookoxex.com/Go/CorpusChristiCollegeBall2024"),
        Event(image: "OUAPS_Ball", title: "OUAPS Ball 2024", start_time: "10 May 2000H", end_time: "", distance: 0, free: false, available: true, website: "https://bookoxex.com/Go/OUAPSBall2024"),
    ]
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(events) { event in EventView(event: event)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
