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
                .background(Color.gray.opacity(0.5))
                .cornerRadius(3)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(category.title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                
                Text(category.description)
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(3)
                    .foregroundColor(.black)
                    .opacity(0.5)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                if category.status == .paid {
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Image(systemName: "lock.fill")
                        
                        Text("Premium")
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.custom(.blue))
                }
            }
            .padding(.vertical, 5)
        }
        .padding(8)
        .overlay(
            Group {
                if category.status == .unknown {
                    Image("coming-soon")
                        .rotationEffect(.degrees(45))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                        .padding(.trailing, 14)
                        .background(Color.black.opacity(0.6))
                }
            }
        )
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: .black.opacity(0.2), radius: 2, y: 2)
    }
}

//struct CategoryCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCellView()
//    }
//}
