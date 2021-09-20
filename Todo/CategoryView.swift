//
//  CategoryView.swift
//  Todo
//
//  Created by 冨田康介 on 2020/12/27.
//

import SwiftUI

struct CategoryView: View {
    var category: TodoEntity.Category
    @State var numberOfTasks = 0
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @State var addNewTask = false
    fileprivate func update() {
        self.numberOfTasks = TodoEntity.count(in: self.viewContext, category: self.category)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
                // 指定したcontentをシート表示する
                // isPresented trueで表示する
                .sheet(isPresented: $showList, onDismiss: { self.update() }) {
                    TodoList(category: self.category)
                        .environment(\.managedObjectContext, self.viewContext)
                }

            Text(category.toString())
            Text("・\(numberOfTasks)タスク")
            Button(action: {
                self.addNewTask = true
            }) {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $addNewTask, onDismiss: { self.update() }) {
                NewTask(category: self.category.rawValue)
                    .environment(\.managedObjectContext, self.viewContext)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight:  150)
        .foregroundColor(.white)
        .background(category.color())
        .cornerRadius(20)
        .onTapGesture {
            self.showList = true
        }
        .onAppear {
            self.update()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st, numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd, numberOfTasks: 0)
            CategoryView(category: .NImpUrg_3rd, numberOfTasks: 0)
            CategoryView(category: .NImpNUrg_4th, numberOfTasks: 0)
        }
        .environment(\.managedObjectContext, context)

    }
}
