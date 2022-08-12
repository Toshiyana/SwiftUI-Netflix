//
//  ComingSoonVM.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/12.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(20)
    }
}
