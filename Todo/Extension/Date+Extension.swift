//
//  Date+Extension.swift
//  Todo
//
//  Created by 冨田康介 on 2021/09/07.
//

import Foundation

extension Date {
    /// 「時分秒」を切り落とした今日の日付を作成
    static var today: Date {
        let calender = Calendar(identifier: .gregorian)
        let time = Date()
        let today = calender.startOfDay(for: time)
        return today
    }
    
    /// 「時分秒」を切り落とした明日の日付を作成
    static var tomorrow: Date {
        let calender = Calendar(identifier: .gregorian)
        let tommorow = calender.date(byAdding: DateComponents(day: 1), to: Date.today)!
        return tommorow
    }
}
