//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.

//https://www.w3.org/TR/css-color-3/#svg-color

import SwiftUI

struct ColorListView: View {
    var colors = ColorModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(colors.colorModel) { c in
                    NavigationLink {
                        ImageGridView(hex: c.hex)
                    } label: {
                        Text(c.name)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Pick a Color")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorListView()
    }
}
