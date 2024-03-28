//
//  ImageGridView.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import SwiftUI

struct ImageGridView: View {
    
    var hex : String
    @ObservedObject var colorvm = ColorViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], content: {
                ForEach(colorvm.artData) { i in
                    ImageCardView(url: i.edmPreview[0])
                }
            })
        }
                .task {
                    colorvm.updateURL(hexa: hex)
                    print(colorvm.url)
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
