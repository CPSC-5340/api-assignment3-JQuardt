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
                    .scaledToFill()
                    //.cornerRadius(10)
                    .frame(width: 130, height: 130)
                    .padding()
            } placeholder: {
                ProgressView()
            }
        }
}

#Preview {
    ImageCardView(url: "")
}
