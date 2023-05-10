//
//  CatBreed.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import Foundation

struct CatBreed: Decodable {
    let name: String
    let country: String
    let intelligence: Int

    private enum CodingKeys: String, CodingKey {
        case name
        case country = "origin"
        case intelligence
    }
}
