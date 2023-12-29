//
//  ContentView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/14.
//

import SwiftUI
import SwiftData

struct TodoListView: View {

    @Environment(\.modelContext) var context

    @Query private var todos: [Todo] = []

    @State private var isSheetActive = false

    var body: some View {
        ZStack {
            VStack {
                List {
                    Section("やること一覧") {
                        ForEach(todos) { todo in
                            TodoCardView(todo: todo)
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                    update()
                                }
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        context.delete(todo)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)

                                }
                        }
                    }
                }
            }
            .sheet(isPresented: $isSheetActive) {
                NavigationStack {
                    AddTodoView()
                }
                .presentationDetents([.medium])
            }

            ActivateButtonView(isActive: $isSheetActive)
        }
    }

    private func delete(_ todo: Todo) {
        context.delete(todo)
    }

    private func update() {
        try? context.save()
    }
}

#Preview {
    TodoListView()
        .modelContainer(for: Todo.self)
}
