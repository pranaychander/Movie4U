//
//  MoviesRepository.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

protocol MoviesRepository {
    func getPopularMovies(forPageNumber pageNumber: Int, completion: @escaping(Result<MoviesData, AppErrors>) -> Void)
}
