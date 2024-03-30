//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.

import SwiftUI

struct BestAuthorsView: View {
    
    @ObservedObject var booksvm = BookViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(booksvm.authorData) { author in
                    NavigationLink {
                        AuthorDetailView(author: author)
                    } label: {
                        Text("\(author.author_name[0])")
                    }
                }
            }
            .task {
                await booksvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Best Authors")
            .alert(isPresented: $booksvm.hasError, error: booksvm.error) {
                Text("")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BestAuthorsView()
    }
}
