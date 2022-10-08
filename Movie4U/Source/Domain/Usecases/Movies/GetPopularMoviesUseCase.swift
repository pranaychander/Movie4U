//
//  GetPopularMoviesUseCase.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

class GetPopularMoviesUseCase {
    private let moviesRepository: MoviesRepository
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
}

extension GetPopularMoviesUseCase: MoviesRepository {
    func getPopularMovies(forPageNumber pageNumber: Int = 1, completion: @escaping(Result<MoviesData, AppErrors>) -> Void) {
        self.moviesRepository.getPopularMovies(forPageNumber: pageNumber) { result in
            completion(result)
        }
    }
}
