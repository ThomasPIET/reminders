//
//  SwiftUIView.swift
//  Reminder
//
//  Created by Thomas PIET on 03/04/2025.
//

import SwiftUI

struct NewReminderView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var isDone: Bool = false
    
    var onCreate: (String, Date, Bool) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Title", text: $title)
                    DatePicker("Due Date", selection: $date)
                }
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .cancellationAction, content: {
                    Button("Cancel") {
                        dismiss()
                    }
                })
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") {
                        onCreate(title, date, isDone)
                        dismiss()
                    }
                }
            }
        }

    }
}

#Preview {
    NewReminderView { title, date, completed in
        print("New reminder: \(title), \(date), \(completed)")
    }
}
