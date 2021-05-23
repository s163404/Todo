//
//  NewTask.swift
//  Todo
//
//  Created by 冨田康介 on 2021/05/23.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date = Date()
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク")) {
                    TextField("タスクを入力", text: $task)
                }
                Section(header: Toggle(isOn: .constant(true)) {
                    Text("時間を指定する") })
                {
                    DatePicker(selection: $time, label: { Text("日時") })
                }
                Section(header: Text("操作")) {
                    Button(action: {}) {
                        HStack(alignment: .center) {
                            Image(systemName: "minus.circle.fill")
                            Text("キャンセル")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("タスクの追加")
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask()
    }
}
