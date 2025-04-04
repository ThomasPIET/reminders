import Foundation

// CHANGE: Make reminders an ObservableObject to track changes
public class ReminderStore: ObservableObject {
    @Published public var reminders: [Reminder] = []
    
    public static let shared = ReminderStore()
    
    init() {
        if let documentsReminders = loadFromDocuments() {
            reminders = documentsReminders
        } else {
            reminders = loadInitialData()
            saveReminders()
        }
    }
    
    private var remindersSaveURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentDirectory.appendingPathComponent("reminders.json")
    }
    
    private func loadFromDocuments() -> [Reminder]? {
        do {
            let data = try Data(contentsOf: remindersSaveURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Reminder].self, from: data)
        } catch {
            return nil
        }
    }
    
    private func loadInitialData() -> [Reminder] {
        let filename = "reminders.json"
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            return []
        }

        do {
            let data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode([Reminder].self, from: data)
        } catch {
            return []
        }
    }
    
    public func saveReminders() {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        do {
            let data = try encoder.encode(reminders)
            try data.write(to: remindersSaveURL)
            print("Reminders saved successfully.")
        } catch {
            print("Failed to save reminders: \(error.localizedDescription)")
        }
    }
    
    public func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
        saveReminders()
    }
    
    public func deleteReminder(at index: Int) {
        reminders.remove(at: index)
        saveReminders()
    }
}
