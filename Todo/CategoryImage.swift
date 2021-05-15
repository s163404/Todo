//
//  CategoryImage.swift
//  Todo
//
//  Created by 冨田康介 on 2020/12/23.
//

import SwiftUI

struct CategoryImage: View {
    var body: some View {
        Image(systemName: "tortoise.fill") // SF Symbolの画像名
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)    // 白いcolor viewを指定
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))      // "Color Literal"
            .cornerRadius(6.0)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage()
    }
}
