//
//  File.swift
//  Reminder
//
//  Created by Thomas PIET on 20/03/2025.
//

import Foundation

public struct Reminder: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var description: String
    public var date: Date
    public var isDone: Bool
}
