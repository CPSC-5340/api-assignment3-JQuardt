//
//  ImageGridView.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import SwiftUI

struct ImageGridView: View {
    
    var hex: String = "#ffa500"
    @ObservedObject var colorvm = ColorViewModel()
    
    var body: some View {
        ScrollView {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(colorvm.artData) { i in
                    Text("Hello")
//                    ImageCardView(url: "https://www.wikihow.com/images/thumb/f/fc/Get-the-URL-for-Pictures-Step-1-Version-6.jpg/v4-460px-Get-the-URL-for-Pictures-Step-1-Version-6.jpg.webp")
                }
//                ImageCardView(url: "https://www.wikihow.com/images/thumb/f/fc/Get-the-URL-for-Pictures-Step-1-Version-6.jpg/v4-460px-Get-the-URL-for-Pictures-Step-1-Version-6.jpg.webp")
            }
        }
                .task {
                await colorvm.fetchData()
            }
                .alert(isPresented: $colorvm.hasError, error: colorvm.error) {
                    Text("")
                }
    }
}

#Preview {
    ImageGridView(hex: "#ffa500")
}
