//
//  MovieData.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

// MARK: - MoviesData
struct MoviesData {
    let page: Int
    let results: [MovieData]
}

// MARK: - MoviesData
struct MovieData {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    var posterUrl: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
