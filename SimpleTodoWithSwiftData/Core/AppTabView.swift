//
//  TabView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Label("やること", systemImage: "doc.text")
                }

            CategoryView()
                .tabItem {
                    Label("カテゴリ", systemImage: "tray.2")
                }
        }
    }
}

#Preview {
    AppTabView()
}
