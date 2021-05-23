//
//  NewTask.swift
//  Todo
//
//  Created by 冨田康介 on 2021/05/23.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("タスクを入力", text: $task)
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
