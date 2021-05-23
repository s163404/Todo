//
//  Binding+Extension.swift
//  Todo
//
//  Created by 冨田康介 on 2021/05/23.
//

import SwiftUI

extension Binding {
    
    
    // 任意のバインディングのオブジェクトがnilかどうかをチェックしてBoolで返す
    init<T>(isNotNil source: Binding<T?>, defaultValue: T) where Value == Bool {
        self.init(get: { source.wrappedValue != nil },
                  set: { source.wrappedValue = $0 ? defaultValue : nil })  // toggleオフならnilオンならdefaultValue
    }
}
