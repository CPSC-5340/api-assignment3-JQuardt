//
//  ImageCardView.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import SwiftUI

struct ImageCardView: View {
    var url: String
    var body: some View {
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
        }
}

#Preview {
    ImageCardView(url: "")
}
