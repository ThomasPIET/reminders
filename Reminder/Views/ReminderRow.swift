import SwiftUI

public struct ReminderRow: View {
    @Binding var reminder: Reminder
    @State var isFilled: Bool = false

    func toggleIsDone() {
        reminder.isDone.toggle()
        isFilled.toggle()
        print("Reminder is \(reminder.isDone ? "true" : "false")")
    }

    public var body: some View {
        VStack {
            HStack {

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        toggleIsDone()
                    }
                }) {
                   ZStack {
                        Circle()
                           .stroke(lineWidth: 1)
                           .foregroundColor(.blue)
                           .frame(width: 30, height: 30)
                        Circle()
                           .fill(.blue)
                            .opacity(isFilled ? 1 : 0)
                            .frame(width: 30, height: 30)
                    }
                }
                
                
                Spacer()
                Text(reminder.title)
                    .font(.headline)
                    .frame(alignment: .leading)
            }
            .padding()
        }
    }
}




