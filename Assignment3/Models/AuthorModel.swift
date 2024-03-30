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
    let country : [String]
    let dataProvider : [String]
    let dcCreator : [String]?
    let dcDescription : [String]?
    let edmPreview : [String]
    let id : String
    let link : String
    let title : [String]
}
