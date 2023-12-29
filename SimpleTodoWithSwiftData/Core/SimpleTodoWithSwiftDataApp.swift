//
//  SimpleTodoWithSwiftDataApp.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/14.
//

import SwiftUI
import SwiftData

@main
struct SimpleTodoWithSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .modelContainer(for: Todo.self)
        }
    }
}
