//
//  File.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import Foundation

public struct Reminder: Codable, Identifiable, Equatable {
    public var id: Int
    public var title: String
    public var date: Date
    public var isDone: Bool
    
    public static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.date == rhs.date
        && lhs.isDone == rhs.isDone 
    }
}
