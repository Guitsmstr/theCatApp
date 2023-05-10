//
//  CatsViewModel.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//
import Foundation
import Combine

class CatListViewModel {
    let apiCats: ApiCats
    var cancellables: Set<AnyCancellable> = []

    @Published var cats: [Cat] = []

    init(apiCats: ApiCats = ApiCats()) {
        self.apiCats = apiCats
    }

    func fetchCatBreeds() {
        apiCats.getCatBreeds()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching cat breeds: \(error)")
                case .finished:
                    print("Finished fetching cat breeds")
                }
            }, receiveValue: { catBreeds in
                self.cats = catBreeds.map { self.convertToCat(breed: $0) }
            })
            .store(in: &cancellables)
    }

    func convertToCat(breed: CatBreed) -> Cat {
    return Cat(
        name: breed.name,
        country: breed.country,
        intelligence: String(breed.intelligence),
        image: nil
    )
}
}
