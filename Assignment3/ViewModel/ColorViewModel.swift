//
//  ColorViewModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

class ColorViewModel : ObservableObject {
    
    var hex : String = "#ffa500"
    @Published var artData = [ArtModel]()
    @Published var hasError = false
    @Published var error : ArtModelError?
    private let url = "https://api.europeana.eu/record/v2/search.json?query=*&reusability=open&media=true&thumbnail=true&landingpage=true&wskey=orkalpaunch&colourpalette=#000000"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(ArtResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = ArtModelError.decodeError
                    return
                }
                self.artData = results.items
            } catch {
                self.hasError.toggle()
                self.error = ArtModelError.customError(error: error)
            }
        }
    }
}

extension ColorViewModel {
    enum ArtModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}
