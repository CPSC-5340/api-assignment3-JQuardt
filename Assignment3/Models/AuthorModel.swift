//
//  ArtModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

struct ApiResults : Codable {
    let numFound : Int
    let start : Int
    let numFoundExact : Bool
    let docs : [AuthorModel]
}

struct AuthorModel : Codable, Identifiable {
    let id = UUID()
    let author_name : [String]
    let first_publish_year : Int
    let first_sentence : [String]?
    let number_of_pages_median : Int
    let publish_date : [String]
    let title : String
    let ratings_average : Double
}
