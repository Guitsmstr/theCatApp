//
//  ApiCats.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import Foundation
import Combine

class ApiCats {
    let networkManager: NetworkManager
    let url = URL(string: "https://api.thecatapi.com/v1/breeds")!

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func getCatBreeds() -> AnyPublisher<[CatBreed], ApiError> {
        let headers = ["x-api-key": "bda53789-d59e-9bc4-2936630fde39"]
        return networkManager.GET(url, headers)
    }
    
//    func getImageUrl(imageId: String) -> AnyPublisher<URL?, ApiError> {
//        let url = URL(string: "https://api.thecatapi.com/v1/images/\(imageId)")!
//        return networkManager.GET(url, ["x-api-key": "bda53789-d59e-9bc4-2936630fde39"])
//                .map { catImage in
//                    URL(string: catImage.url) }
//                .eraseToAnyPublisher()
//    }
}
