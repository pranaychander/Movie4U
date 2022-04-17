//
//  APIClientProtocol.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Foundation

typealias NetworkSuccessHandler = (Data, URLResponse?) -> Void
typealias NetworkFailureHandler = (Data?, URLResponse?, NetworkError) -> Void

protocol APIClientProtocol {
    func fetch<T: Codable>(request: APIData, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
                           completionHandler: @escaping ((Result<T,NetworkError>) -> Void))
    
    func fetch(request: APIData, success: @escaping NetworkSuccessHandler, failure: @escaping NetworkFailureHandler)
}
