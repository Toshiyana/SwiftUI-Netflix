//
//  Trailer.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/08.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
