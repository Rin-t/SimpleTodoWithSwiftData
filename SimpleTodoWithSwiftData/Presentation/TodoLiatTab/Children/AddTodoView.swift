//
//  AddTodoView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query private var todos: [Todo] = []

    @State private var inputText = ""
    @State private var selectedPriority: Priority?


    var body: some View {
        List {
            Section("やることを追加") {
                TextField("追加するタスクを入力", text: $inputText)
            }

            Section("優先度を選択") {
                Picker("", selection: $selectedPriority) {
                    Text("選択なし")
                        .tag(Priority?.none)

                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text("\(priority.title)")
                            .tag(Priority?.some(priority))
                    }
                }
            }

        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    insert()
                    dismiss()
                } label: {
                    Text("追加")
                }
                .disabled(inputText.isEmpty)
            }
        }
    }

    func insert() {
        let data = Todo(task: inputText, priority: selectedPriority)
        context.insert(data)
    }
}

#Preview {
    AddTodoView()
        .modelContainer(for: [Todo.self])
}
