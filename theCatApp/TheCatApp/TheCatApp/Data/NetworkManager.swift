//
//  NetworkManager.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import Foundation
import Combine

class NetworkManager {
    var session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func GET<T: Decodable>(_ url: URL, _ headers: [String: String] = [:]) -> AnyPublisher<T, ApiError> {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            return URLSession.shared
                .dataTaskPublisher(for: request)
                .tryMap { output in
                    guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw ApiError.httpError((output.response as? HTTPURLResponse)?.statusCode ?? 500)
                    }
                    return output.data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { error in
                    switch error {
                    case is URLError:
                        return ApiError.httpError((error as? URLError)?.errorCode ?? 500)
                    case is DecodingError:
                        return ApiError.decodingError
                    default:
                        return ApiError.unknown
                    }
                }
                .eraseToAnyPublisher()
        }
}

