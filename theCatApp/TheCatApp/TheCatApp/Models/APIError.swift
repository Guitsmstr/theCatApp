//
//  APIError.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import Foundation

enum ApiError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
