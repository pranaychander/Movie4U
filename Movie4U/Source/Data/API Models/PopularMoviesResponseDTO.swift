//
//  PopularMoviesResponseDTO.swift
//  Movie4U
//
//  Created by Harish Anantharaman on 19/04/22.
//

import Foundation

// MARK: - PopularMoviesResponseDTO
struct PopularMoviesResponseDTO: Codable {
    let page: Int
    let results: [PopularMoviesResultDTO]
    
    func toEntity() throws -> MoviesData {
        do {
            let movieResults: [MovieData] = try results.map({ movieDTO in
                 try movieDTO.toEntity()
            })
            return MoviesData(page: page, results: movieResults)
        } catch {
            throw AppErrors.dataUnavailable
        }
    }
}

// MARK: - PopularMoviesResultDTO
struct PopularMoviesResultDTO: Codable {
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

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toEntity() throws -> MovieData {
        return MovieData(
            adult: self.adult,
            backdropPath: self.backdropPath,
            genreIDS: self.genreIDS,
            id: self.id,
            originalLanguage: self.originalLanguage,
            originalTitle: self.originalLanguage,
            overview: self.overview,
            popularity: self.popularity,
            posterPath: self.posterPath,
            releaseDate: self.releaseDate,
            title: self.title,
            video: self.video,
            voteAverage: self.voteAverage,
            voteCount: self.voteCount)
    }
}
