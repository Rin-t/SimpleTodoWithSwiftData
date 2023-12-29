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


    var body: some View {
        List {
            Section("やることを追加") {
                TextField("追加するタスクを入力", text: $inputText)
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
        let data = Todo(task: inputText)
        context.insert(data)
    }
}

#Preview {
    AddTodoView()
        .modelContainer(for: [Todo.self])
}
