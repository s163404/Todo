//
//  NewTask.swift
//  Todo
//
//  Created by 冨田康介 on 2021/05/23.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date? = Date()
    @State var category: Int16 = TodoEntity.Category.ImpUrg_1st.rawValue
    var categories: [TodoEntity.Category]
        = [.ImpUrg_1st, .ImpNUrg_2nd, .NImpUrg_3rd, .NImpNUrg_4th]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク")) {
                    TextField("タスクを入力", text: $task)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())) {
                    Text("時間を指定する") })
                {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: {
                            Text("日時") })
                    } else {
                        Text("時間未設定")
                            .foregroundColor(.secondary)
                    }
                }
                Picker(selection: $category, label: Text("種類")) {
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            CategoryImage(category)
                            Text(category.toString())
                        }
                        .tag(category.rawValue)
                    }
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
