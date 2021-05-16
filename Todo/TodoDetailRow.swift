//
//  TodoDetailRow.swift
//  Todo
//
//  Created by 冨田康介 on 2021/05/16.
//

import SwiftUI

struct TodoDetailRow: View {
    // DBのエンティティとバインディングするために@ObservedObject, @Stateのオブジェクト版
    @ObservedObject var todo: TodoEntity
    
    var body: some View {
        HStack {
            CategoryImage(TodoEntity.Category(rawValue: todo.category))
            Checkbox(checked: .constant(true)) {
                Text(self.todo.task ?? "no title")
            }
        }
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来への人間関係づくり"
        newTodo.state = TodoEntity.State.done.rawValue
        newTodo.category = 0
        
        return TodoDetailRow(todo: newTodo)
    }
}
