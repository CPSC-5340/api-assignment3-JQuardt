//
//  ImageGridView.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import SwiftUI

struct AuthorDetailView: View {
    
    var author : AuthorModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(author.author_name[0])")
                .font(.system(size: 20))
                .bold()
            Text("Book Title: \(author.title)")
            Text("Year First Published: \(author.first_publish_year)")
            Text("Number of Pages: \(author.number_of_pages_median)")
            //Text("First Sentence: \n\(author.first_sentence)")
            Text("Average Reader Rating: \(author.ratings_average)")
        }
    }
}
