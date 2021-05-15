//
//  Checkbox.swift
//  Todo
//
//  Created by 冨田康介 on 2020/12/24.
//

import SwiftUI



struct Checkbox<Label>: View where Label: View {
    // ＜＞で指定したLabelはView型である（Viewに適合する）という条件
    // Viewはプロトコル
    
    @Binding var checked: Bool
    private var label: () -> Label
    
    public init(checked: Binding<Bool>,
                @ViewBuilder label: @escaping () -> Label)
    {
        self._checked = checked     // _ はBindingにアクセスするためにつける
        self.label = label
    }
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    self.checked.toggle()
            }
            label()     // trailing closureの記法
        }
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Checkbox(checked: .constant(false)) {
                Text("牛乳を買う")
            }
            Checkbox(checked: .constant(false)) {
                Image(systemName: "hand.thumbsup")
            }
            Checkbox(checked: .constant(false)) {
                Text("アイスを買う")
                Image(systemName: "hand.thumbsup")
            }
        }
    }
}
