//
//  APIDataProtocol.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Foundation

protocol APIData {
    var basePath: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams { get }
    var headers: [String: String]? { get }
    var dataType: ResponseDataType { get }
    func absolutePath(from basePath: String) -> String
}

extension APIData {
    func absolutePath(from basePath: String) -> String {
        return basePath + path
    }
}
