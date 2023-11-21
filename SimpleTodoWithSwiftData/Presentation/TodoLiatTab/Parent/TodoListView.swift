//
//  ContentView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/14.
//

import SwiftUI
import SwiftData

struct TodoListView: View {

    private enum Filter {
        case onlyCompleted
        case unCompleted
        case all

        var title: String {
            switch self {
            case .onlyCompleted: "完了のみ"
            case .unCompleted: "未完了のみ"
            case .all: "すべて"
            }
        }
    }

    @Environment(\.modelContext) var context

    @Query private var todos: [Todo] = []

    @State private var isSheetActive = false
    @State private var filter: Filter = .all

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()

                    Menu(filter.title) {
                        Button(Filter.all.title) {
                            filter = .all
                        }
                        Button(Filter.onlyCompleted.title) {
                            filter = .onlyCompleted
                        }
                        Button(Filter.unCompleted.title) {
                            filter = .unCompleted
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.trailing, 24)
                }

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

    private func create() {

    }
}

#Preview {
    TodoListView()
        .modelContainer(for: Todo.self)
}
