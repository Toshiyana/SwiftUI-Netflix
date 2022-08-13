//
//  PreviewVM.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/13.
//

import Foundation

class PreviewVM: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
