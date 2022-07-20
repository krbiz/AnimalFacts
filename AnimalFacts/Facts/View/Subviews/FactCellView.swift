//
//  FactCellView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI
import Kingfisher

struct FactCellView: View {
    let fact: AnimalContent
    @Binding var index: Int
    let count: Int
    
    @State private var state = UUID()
    
    var body: some View {
        VStack(spacing: 14) {
            KFImage(URL(string: fact.image))
                .cacheMemoryOnly()
                .memoryCacheExpiration(.expired)
                .resizable()
                .scaledToFill()
                .frame(width: imageSize.width, height: imageSize.height)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(3)
                .id(state)
            
            Text(fact.fact)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            HStack {
                Button {
                    index -= 1
                } label: {
                    Image("back-circle")
                }
                .opacity(index == 0 ? 0.5 : 1)
                .disabled(index == 0)
                
                Spacer()
                
                Button {
                    index += 1
                } label: {
                    Image("back-circle")
                        .scaleEffect(x: -1)
                }
                .opacity(index == count - 1 ? 0.5 : 1)
                .disabled(index == count - 1)
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 15)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(6)
        .onAppear {
            state = UUID()
        }
    }
    
    private var imageSize: CGSize {
        let width: CGFloat = UIScreen.main.bounds.width - 84
        let height: CGFloat = width * 0.8
        return CGSize(width: width, height: height)
    }
}

//struct FactView_Previews: PreviewProvider {
//    static var previews: some View {
//        FactCellView()
//    }
//}
