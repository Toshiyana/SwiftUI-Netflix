//
//  Movie.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/07.
//

import SwiftUI

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    var genre: HomeGenre = .AllGenres // default
    
    // MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    // Personalization
    var currentEpisode: CurrentEpisodeInfo?
    
    var accentColor: Color? = .white
    
    var defaultEpisodeInfo: CurrentEpisodeInfo
    var creators: String
    var cast: String
    
    var moreLikeThisMovies: [Movie]
    
    var episodes: [Episode]?
    
    var movieType: MovieType {
        return episodes == nil ? .movie : .tvShow
    }
    
    var promotionHeadline: String?
    
    var trailers: [Trailer]
    
    var previewImageName: String
    var previewVideoURL: URL?
    
    var numberOfSeasonsDisplay: String {
        guard let num = numberOfSeasons else { return "" }
        
        if num == 1 {
            return "1 Season"
        } else {
            return "\(num) Seasons"
        }
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        } else {
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        } else {
            return defaultEpisodeInfo.description
        }
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}

enum MovieType {
    case movie
    case tvShow
}
