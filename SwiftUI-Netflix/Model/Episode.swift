//
//  Episode.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/08.
//

import Foundation

struct Episode: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
