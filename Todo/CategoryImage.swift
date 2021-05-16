//
//  CategoryImage.swift
//  Todo
//
//  Created by 冨田康介 on 2020/12/23.
//

import SwiftUI

struct CategoryImage: View {
    var category: TodoEntity.Category
    
    init(_ category: TodoEntity.Category?) {
        self.category = category ?? .ImpUrg_1st
    }
    
    var body: some View {
        Image(systemName: category.image()) // SF Symbolの画像名
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)    // 白いcolor viewを指定
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(category.color())      // "Color Literal"
            .cornerRadius(6.0)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage(TodoEntity.Category.ImpUrg_1st)
    }
}
