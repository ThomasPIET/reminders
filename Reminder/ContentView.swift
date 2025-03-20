//
//  ContentView.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) { 
            Text("Reminder")
                .font(.title)
                .fontWeight(.bold)
                .padding([.top, .leading], 16.0)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        
        Spacer()
        
        ReminderCard()
    }
}
    


#Preview {
    ContentView()
}
