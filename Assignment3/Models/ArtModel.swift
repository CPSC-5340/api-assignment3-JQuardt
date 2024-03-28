//
//  ArtModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

struct ArtResults : Codable {
    let success : String
    let itemsCount : String
    let totalResults : String
    let items : [ArtModel]
}

struct ArtModel : Codable, Identifiable {
    let country : [String]
    let dataProvider : [String]
    let dcCreator : [String]
    let dcDescription : [String]
    let id : String
    let link : String
    let title : [String]
}
