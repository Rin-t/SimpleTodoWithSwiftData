//
//  CategoryView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI
import SwiftData

struct CategoryView: View {

    @Environment(\.modelContext) var context

    @Query private var categories: [Category] = []

    @State private var isSheetActive = false

    var body: some View {
        ZStack {
            List {
                Section("カテゴリ一覧") {
                    ForEach(categories) { category in
                        Text(category.name)
                            .swipeActions(edge: .trailing,
                                          allowsFullSwipe: false) {
                                Button {
                                    context.delete(category)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)

                            }
                    }
                }
            }
            .sheet(isPresented: $isSheetActive) {
                NavigationStack {
                    AddCategoryView()
                }
                .presentationDetents([.medium])
            }

            ActivateButtonView(isActive: $isSheetActive)
        }
    }

    func delete(_ category: Category) {
        context.delete(category)
    }
}

#Preview {
    CategoryView()
        .modelContainer(for: Category.self)
}
