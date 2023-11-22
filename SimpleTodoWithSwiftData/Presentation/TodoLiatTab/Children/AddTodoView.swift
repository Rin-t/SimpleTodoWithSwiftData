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
    @Query private var categories: [Category] = []

    @State private var inputText = ""
    @State private var selectedCategory: Category?


    var body: some View {
        List {
            Section("やることを追加") {
                TextField("追加するタスクを入力", text: $inputText)
            }

            Section("カテゴリを選択\n※カテゴリ指定しなくても保存は可能です") {
                if categories.isEmpty {
                    Text("カテゴリがありません。\nカテゴリタブから追加できます。")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                } else {
                    Picker("", selection: $selectedCategory) {
                        Text("選択なし")
                            .tag(Category?.none)

                        ForEach(categories, id: \.self) { category in
                            Text("\(category.name)")
                                .tag(Category?.some(category))
                        }
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
        print(selectedCategory?.name)
        let data = Todo(task: inputText, category: selectedCategory)
        context.insert(data)
    }
}

#Preview {
    AddTodoView()
        .modelContainer(for: [Todo.self, Category.self])
}
