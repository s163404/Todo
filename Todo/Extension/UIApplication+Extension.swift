//
//  UIApplication+Extension.swift
//  Todo
//
//  Created by 冨田康介 on 2021/09/20.
//

import SwiftUI

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
