//
//  TodoCardView.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import SwiftUI

struct TodoCardView: View {

    private let todo: Todo

    init(todo: Todo) {
        self.todo = todo
    }

    var body: some View {
        HStack {

            Image(systemName: todo.isCompleted ? 
                  "checkmark.square" : "square")
            .resizable()
            .frame(width: 20, height: 20)
            .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text("\(todo.task)")
                    .padding(.bottom, 8)
                    .font(.title)

                Text("\(todo.priority?.title ?? "")")
            }

            Spacer()
            
            VStack(alignment: .leading) {
                Spacer()
                Text("作成日")
                Text("\(todo.createdAt.string())")
            }
        }
    }
}

#Preview {
    let todo = Todo(task: "TDDの勉強")
    return TodoCardView(todo: todo)
}
