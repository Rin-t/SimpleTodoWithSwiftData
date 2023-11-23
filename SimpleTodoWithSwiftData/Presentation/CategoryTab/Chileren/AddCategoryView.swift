//
//  AddCategoryView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/19.
//

import SwiftUI
import SwiftData

struct AddCategoryView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Query private var categories: [Category] = []

    @State private var inputText = ""

    var body: some View {
        List {
            Section("カテゴリを追加") {
                TextField("追加するカテゴリを入力", text: $inputText)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    insert(category: inputText)
                    dismiss()
                } label: {
                    Text("追加")
                }
                .disabled(inputText.isEmpty)

            }
        }
    }

    func insert(category: String) {
        let data = Category(name: category)
        context.insert(data)
    }
}

#Preview {
    AddCategoryView()
}
