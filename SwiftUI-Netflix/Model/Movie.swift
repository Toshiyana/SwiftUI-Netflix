//
//  Movie.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/07.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadLine: String?
    
    var numberOfSeasonsDisplay: String {
        guard let num = numberOfSeasons else { return "" }
        
        if num == 1 {
            return "1 Season"
        } else {
            return "\(num) Seasons"
        }
    }
}
