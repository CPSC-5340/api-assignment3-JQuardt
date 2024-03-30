//
//  ImageGridView.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import SwiftUI

struct AuthorDetailView: View {
    
    var hex : String
    @ObservedObject var colorvm = BookViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], content: {
                ForEach(colorvm.artData) { i in
                    ImageCardView(url: i.edmPreview[0])
                        .onTapGesture {
//                            NavigationLink {
//                                ColorListView()
//                            } label: {
//                                Text("Text")
//                            }
                        }
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
    AuthorDetailView(hex: "#ffa500")
}
