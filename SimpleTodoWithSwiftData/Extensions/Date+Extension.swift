//
//  Date+Extension.swift
//  SimpleTodoWithSwiftData
//
//  Created by Rin on 2023/11/18.
//

import Foundation

extension Date {

    /// 指定したdataStyle, timeStyle、local: JPで変換
    func string(dateStyle: DateFormatter.Style = .medium,
                timeStyle: DateFormatter.Style = .short) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: self)
    }
}
