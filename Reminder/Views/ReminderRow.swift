import SwiftUI

public struct ReminderRow: View {
    @Binding var reminder: Reminder

    func toggleIsDone() {
        reminder.isDone.toggle()
        print("Reminder is \(reminder.isDone ? "true" : "false")")
    }

    public var body: some View {
        VStack {
            HStack {
                Text(reminder.title)
                    .font(.headline)
                Spacer()

                Button(action: toggleIsDone) {
                    Text(reminder.isDone ? "Completed" : "Mark as Done")
                }

                Text(reminder.isDone ? "✔️" : "❌")
                    .foregroundColor(reminder.isDone ? .green : .red)
            }
            .padding()
        }
    }
}
