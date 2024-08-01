//
//  likeButton.swift
//  nearme
//
//  Created by Meghna Sampath on 8/1/24.
//

import SwiftUI

struct likeButton: View {
    @State private var isLiked = false
    var body: some View {
        Button {
            self.isLiked.toggle()
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 20))
        }
        
    }
}

#Preview {
    likeButton()
}
