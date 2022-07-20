//
//  FavouriteCellView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 20.07.2022.
//

import SwiftUI

struct FavouriteCellView: View {
    let factsCount: Int
    
    var body: some View {
        HStack {
            Text("Favourites: \(factsCount)")
                .font(.system(size: 30, weight: .bold))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 116)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(color: .black.opacity(0.2), radius: 2, y: 2)
    }
}

//struct FavouriteCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouriteCellView()
//    }
//}
