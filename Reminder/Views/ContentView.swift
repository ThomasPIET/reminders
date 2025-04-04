//
//  ContentView.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = ReminderStore.shared
    @State private var isShowingNewReminder = false
    
    func deleteItems(at offsets: IndexSet) {
          offsets.forEach { index in
              store.deleteReminder(at: index)
          }
      }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(store.reminders.indices, id: \.self) { index in
                                            ReminderRow(reminder: $store.reminders[index])
                                                .onChange(of: store.reminders[index]) { _, _ in
                                                    store.saveReminders()
                                                }
                                        }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Reminders")
                .toolbar{
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add Reminder") {
                            isShowingNewReminder.toggle()
                        }
                            
                    }
                }
              
            }
        }
        .sheet(isPresented: $isShowingNewReminder) {
            NewReminderView {title, dueDate, isCompleted in
                let newId = (store.reminders.map { $0.id }.max() ?? 0) + 1
                let newReminder = Reminder(id: newId, title: title, date: dueDate, isDone: isCompleted)
                store.addReminder(newReminder)
            }
        }
    }
}

#Preview {
    ContentView()
}
