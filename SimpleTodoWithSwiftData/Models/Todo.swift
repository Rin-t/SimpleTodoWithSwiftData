//
//  ToDo.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/14.
//

import Foundation
import SwiftData

@Model
final class Todo {
    let task: String
    let createdAt = Date()
    var isCompleted = false
    var priority: Priority?

    init(task: String, priority: Priority? = nil) {
        self.task = task
        self.priority = priority
    }
}

enum Priority: CaseIterable, Codable {
    case high
    case medium
    case low

    var title: String {
        switch self {
        case .high:
            return "high"
        case .medium:
            return "medium"
        case .low:
            return "low"
        }
    }
}


