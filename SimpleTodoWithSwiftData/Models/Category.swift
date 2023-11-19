//
//  Category.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import Foundation
import SwiftData

@Model
final class Category {
    
    let name: String

    @Relationship(deleteRule: .cascade, inverse: \Todo.category)
    var todos: [Todo]?

    init(name: String) {
        self.name = name
    }
}
