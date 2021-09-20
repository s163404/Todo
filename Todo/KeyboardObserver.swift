//
//  KeyboardObserver.swift
//  Todo
//
//  Created by 冨田康介 on 2021/09/20.
//

import SwiftUI
import Combine

// memo: 変更監視対象のクラス
class KeyboardObserver: ObservableObject {
    
    // memo: 監視対象のプロパティ
    @Published var keyboardHeight: CGFloat = 0.0
    
    func startObserve() {
        NotificationCenter
        .default
        .addObserver(self,
                     selector: #selector(keyboardWillChangeFrame),
                     name: UIResponder.keyboardWillChangeFrameNotification,
                     object: nil)
    }
    
    func stopObserve() {
        NotificationCenter
            .default
            .removeObserver(self,
                            name: UIResponder.keyboardWillChangeFrameNotification,
                            object: nil)
    }
    
    @objc
    func keyboardWillChangeFrame(_ notification: Notification) {
        if let keyboardEndFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
            let keyboardBeginFrame = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        {
            let endMinY = keyboardEndFrame.cgRectValue.minY
            let beginMinY = keyboardBeginFrame.cgRectValue.minY
            keyboardHeight = beginMinY - endMinY
            if keyboardHeight < 0 {
                keyboardHeight = 0
            }
        }
    }
}
