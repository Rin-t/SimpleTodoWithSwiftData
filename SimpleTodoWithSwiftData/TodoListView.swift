//
//  ContentView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/14.
//

import SwiftUI
import SwiftData

struct TodoListView: View {

    @Query private var todos: [Todo] = []
    @Environment(\.modelContext) var context

    var body: some View {
        List {
            ForEach(todos) { todo in
                Text(todo.task)
            }
        }
    }

    func store(task: String) {
        let data = Todo(task: task, 
                        createdAt: Date())
        context.insert(data)
    }
}

#Preview {
    TodoListView()
        .modelContainer(for: Todo.self)
}
