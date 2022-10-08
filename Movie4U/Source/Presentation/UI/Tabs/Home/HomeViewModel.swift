//
//  HomeViewModel.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 16/04/22.
//

import Foundation

class HomeViewModel {
    private let getPopularMoviesUseCase: GetPopularMoviesUseCase
    
    var moviesArray: [MovieData] = []
    
    init(getPopularMoviesUseCase: GetPopularMoviesUseCase) {
        self.getPopularMoviesUseCase = getPopularMoviesUseCase
    }
    
    func getPopularMovies(pageNumber: Int, completion: @escaping(Result<MoviesData, AppErrors>) -> Void) {
        self.getPopularMoviesUseCase.getPopularMovies(forPageNumber: pageNumber) { result in
            switch result {
            case .success(let moviesData):
                self.moviesArray = moviesData.results
                completion(.success(moviesData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
