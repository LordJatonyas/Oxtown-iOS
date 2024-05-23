//
//  EventsList.swift
//  Oxtown
//
//  Created by John Lee on 16/5/24.
//

import Foundation

/*
 
var explore_events = [
    
    Event(image: "Jesus",
          title: "Jesus Finalist Massages",
          start_time: "21 May",
          details: "Only 18 spots",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Principals BBQ",
          start_time: "21 May",
          details: "In 2nd Quad",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "Phys_Study_Date",
          title: "Café Study Date PhysSoc x OxWest",
          start_time: "22 May 1500H",
          details: "At the Newground Café OX1 3DE\nFree drinks & pastries on a first come first serve basis",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C7MGpXBtSH5/"
         ),
    
    Event(image: "HMC",
          title: "HMC Blues Week Pub Crawl",
          start_time: "24 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Sip and Paint",
          start_time: "24 May",
          details: "This is a BSL learning event",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "HMC",
          title: "HMC 25+ Social",
          start_time: "25 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Summer VIIIs Boathouse Party",
          start_time: "25 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "PPH_Ball",
          title: "Dodo Disco: 3rd Annual PPH Ball",
          start_time:"25 May 2000H",
          details: "",
          free: false,
          available: true,
          website: "https://bookoxex.com/Go/ThePermanentPrivateHallsBall"
         ),
    
    Event(image: "AI_Train_Comm_Hack",
          title: "AI Training + Community Hackathon",
          start_time: "26 May 1000H",
          details: "Teaching Room (277), Oxford e-Research Centre, Oxford\nFREE PIZZA AND £500 TOP PRIZE\nAgenda: \n10AM : Intro to Rafael and Jonathan\n10:15: ⁠Introduction to Framework and Tech, including examples\n11:00: Hackathon Begins\n13:00: Pizza Break\n4:30:⁠ Show and Tell\n5:00 Winners Announced\n5:30pm: Community Hangout @ Pub",
          free: true,
          available: true,
          website: "https://tukitoday.typeform.com/to/Fpo4ysPN"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Botanical Watercolour",
          start_time: "26 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "HMC",
          title: "HMC MCR Tea Party",
          start_time: "31 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus JCR/MCR BAME picnic",
          start_time: "31 May",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "HMC",
          title: "HMC Day Trip",
          start_time: "01 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Stevens Garden Party",
          start_time: "01 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "HMC",
          title: "HMC Punting",
          start_time: "04 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus LGBTQIA+ Pride Event",
          start_time: "07 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Movie Night in JCR",
          start_time: "08 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "RPC_Ball",
          title: "RPC Final Fling 2024",
          start_time:"08 Jun 1900H",
          details: "",
          free: false,
          available: false,
          website: "https://bookoxex.com/Go/RPCFinalFling2024"
         ),
    
    Event(image: "HMC",
          title: "HMC Sports Day",
          start_time: "09 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "HMC",
          title: "HMC Club Night",
          start_time: "14 Jun",
          details: "",
          free: false,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus EoY Bar Party",
          start_time: "14 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "HMC",
          title: "HMC Send-off Picnic",
          start_time: "15 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C5yFqTeIPqk/"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Inter-College Cricket Tournament",
          start_time: "15 Jun",
          details: "At Barts",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Summer Soiree",
          start_time: "20 Jun",
          details: "",
          free: false,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "Univ_Ball",
          title: "University College Ball",
          start_time:"21 Jun 1900H",
          details: "",
          free: false,
          available: false,
          website: "https://bookoxex.com/Go/UniversityCollegeBall2024"
         ),
    
    Event(image: "Pembroke_Ball",
          title: "Pembroke College Ball",
          start_time:"21 Jun 1900H",
          details: "",
          free: false,
          available: false,
          website: "https://bookoxex.com/Go/PembrokeCollegeCommemorationBall2024"
         ),
    
    Event(image: "Garden_Party",
          title: "Balliol Garden Party 2024",
          start_time:"22 Jun 1730H",
          details: "",
          free: false,
          available: true,
          website: "https://bookoxex.com/Go/GardenParty2024"
         ),
    
    Event(image: "Jesus",
          title: "Jesus Finalists BBQ & Croquet Tournament",
          start_time: "22 Jun",
          details: "",
          free: true,
          available: true,
          website: "https://www.instagram.com/p/C6JBEddIJId/?img_index=2"
         ),
    
    Event(image: "LLMxLaw",
          title: "LLM X Law Hackathon",
          start_time:"23 Jun 0800H",
          details: "Hosted in Cambridge",
          free: true,
          available: true,
          website: "https://hackthelaw-cambridge.com"
         ),
    
    Event(image: "GTC_Ball",
          title: "GTC Ball 2024",
          start_time:"28 Jun 2000H",
          details: "",
          free: false,
          available: true,
          website: "https://bookoxex.com/Go/GTCBall2024"
         ),
    
    Event(image: "Oxford_Energy_Hackathon",
          title: "Oxford Energy Hackathon",
          start_time: "01 Jul 0800H",
          details: "",
          free: true,
          available: true,
          website: "https://forms.gle/BprEbNgW9Enx9tfj9"
         )
    
]

var featured_events: [Event] = []

var my_events: [Event] = []
 
 */
