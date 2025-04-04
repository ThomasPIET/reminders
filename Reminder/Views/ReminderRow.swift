import SwiftUI

public struct ReminderRow: View {
    @Binding var reminder: Reminder
    @State var isFilled: Bool = false

    func toggleIsDone() {
        reminder.isDone.toggle()
        isFilled.toggle()
        print("\(reminder.title) is \(reminder.isDone ? "true" : "false")")
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
                            .stroke(lineWidth: 1.5)
                            .foregroundColor(.blue)
                            .frame(width: 30, height: 30)

                        Circle()
                            .fill(.blue)
                            .opacity(isFilled ? 1 : 0)
                            .frame(width: 30, height: 30)
                            .scaleEffect(isFilled ? 1 : 0.1)
                            .transition(.scale)

                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                                    .transition(.scale.combined(with: .opacity))
                            )
                    }
                }

                Text(reminder.title)
                    .font(.headline)
                    .padding(.leading)
            }
            .padding()
        }
        .onAppear() {
            isFilled = reminder.isDone
        }
    }
}
