//
//  ColorViewModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

class BookViewModel : ObservableObject {
    
    @Published var hex : String = "#9acd32"
    @Published private(set) var artData = [ArtModel]()
    @Published var hasError = false
    @Published var error : ArtModelError?
    var url = "https://api.europeana.eu/record/v2/search.json?query=*&reusability=open&media=true&thumbnail=true&landingpage=true&wskey=orkalpaunch&sort=random&rows=12&languageCodes=en&colourpalette=#9acd32"
    
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
                print(error)
                self.hasError.toggle()
                self.error = ArtModelError.customError(error: error)
            }
        }
    }
    
    func updateURL(hexa: String) {
        self.url = "https://api.europeana.eu/record/v2/search.json?query=*&reusability=open&media=true&thumbnail=true&landingpage=true&wskey=orkalpaunch&sort=random&rows=12&languageCodes=en&colourpalette=" + hexa
        self.hex = hexa
    }
}

extension BookViewModel {
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
