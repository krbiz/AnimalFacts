//
//  CategoryCellView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI
import Kingfisher

struct CategoryCellView: View {
    let category: Category
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            KFImage(URL(string: category.image))
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 90)
                .clipped()
            
            VStack(alignment: .leading, spacing: 0) {
                Text(category.title)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.black)
                
                Text(category.description)
                    .font(.system(size: 12, weight: .regular))
                    .lineLimit(5)
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(.top, 5)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            Color.white
                .cornerRadius(6)
                .shadow(color: .black.opacity(0.2), radius: 2, y: 2)
        )
    }
}

//struct CategoryCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCellView()
//    }
//}
