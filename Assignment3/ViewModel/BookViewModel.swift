//
//  ColorViewModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

class BookViewModel : ObservableObject {
    
    @Published private(set) var authorData = [AuthorModel]()
    @Published var hasError = false
    @Published var error : BookModelError?
    private var url = "https://openlibrary.org/search.json?q=best+authors&limit=13"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(ApiResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = BookModelError.decodeError
                    return
                }
                self.authorData = results.docs
            } catch {
                print(error)
                self.hasError.toggle()
                self.error = BookModelError.customError(error: error)
            }
        }
    }
}

extension BookViewModel {
    enum BookModelError : LocalizedError {
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
