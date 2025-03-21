//
//  ContentView.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var reminderList = reminders

    var body: some View {
        VStack(alignment: .leading) {
            Text("Reminder")
                .font(.title)
                .fontWeight(.bold)
                .padding([.top, .leading], 16.0)

            List {
                ForEach(reminderList.indices, id: \.self) { index in
                    ReminderRow(reminder: $reminderList[index])
                }
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

        Spacer()

    }
}

#Preview {
    ContentView()
}
