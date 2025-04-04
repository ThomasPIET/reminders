//
//  ReminderApp.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import SwiftUI

@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Reminder", systemImage: "clock") {
                    ContentView()
                }
                Tab("Account", systemImage: "person.crop.circle.fill") {
                    Backlog()
                   }
            }
        }
    }
}

