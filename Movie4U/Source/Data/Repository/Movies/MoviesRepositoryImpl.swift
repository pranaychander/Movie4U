//
//  MoviesRepository.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

final class MoviesRepositoryImpl {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension MoviesRepositoryImpl: MoviesRepository {
    func getPopularMovies(forPageNumber pageNumber: Int, completion: @escaping (Result<MoviesData, AppErrors>) -> Void) {
        self.apiClient.fetch(request: MovieAPIData.getPopularMoviesAPIData(pageNumber: pageNumber), keyDecodingStrategy: .useDefaultKeys) { (result: Result<PopularMoviesResponseDTO, NetworkError>) in
            switch result {
            case .success(let moviesDTO):
                do {
                    let entityData = try moviesDTO.toEntity()
                    completion(.success(entityData))
                } catch(let error) {
                    completion(.failure(error as! AppErrors))
                }
            case .failure(let apiError):
                AppLogger.log(level: .error, args: apiError)
                completion(.failure(apiError.toAppError()))
            }
        }
    }
}
