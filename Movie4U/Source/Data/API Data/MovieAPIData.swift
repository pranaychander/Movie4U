//
//  MovieAPIData.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

struct MovieAPIData: APIData {
    var basePath: String = "https://api.themoviedb.org/3"
    
    var path: String
    
    var method: HTTPMethod
    
    var parameters: RequestParams
    
    var headers: [String : String]?
    
    var dataType: ResponseDataType
    
    private static let API_KEY = "94e49f92698ded34420ab288010e0c59"
}

extension MovieAPIData {
    init(path: String, method: HTTPMethod, parameters: RequestParams, dataType: ResponseDataType) {
        self.path = path
        self.method = method
        var updatedParams = parameters
        updatedParams.urlParams?["api_key"] = MovieAPIData.API_KEY
        self.parameters = updatedParams
        self.dataType = dataType
    }
}

extension MovieAPIData {
    static func getPopularMoviesAPIData(pageNumber: Int) -> APIData {
       let apiData = MovieAPIData(path: "/movie/popular",
                                  method: .get,
                                  parameters: .init(urlParams: ["page":"\(pageNumber)"], bodyParams: [:]),
                                  dataType: .JSON)
        return apiData
    }
}
