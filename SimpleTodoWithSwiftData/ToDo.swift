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
    let createdAt: Date
    var isCompleted = false

    init(task: String, createdAt: Date) {
        self.task = task
        self.createdAt = createdAt
    }
}
