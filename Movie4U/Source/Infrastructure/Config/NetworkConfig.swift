//
//  NetworkConfig.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 17/04/22.
//

import Foundation

public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
    case patch
}

public enum ResponseDataType {
    case Data
    case JSON
}

public enum Encoding: String {
    case URL
    case JSON
}

public enum HeaderContentType: String {
    case json = "application/json"
}

enum HTTPHeaderKeys: String {
    case contentType = "Content-Type"
    case cookie = "Cookie"
}

public struct RequestParams {
    var urlParams: [String: String]?
    let bodyParams: [String: Any]?
    let contentType: HeaderContentType
    
    init(urlParams: [String: String], bodyParams: [String: Any], contentType: HeaderContentType = .json) {
        self.urlParams = urlParams
        self.bodyParams = bodyParams
        self.contentType = contentType
    }
}
