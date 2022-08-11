//
//  SearchVM.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/11.
//

import SwiftUI

class SearchVM: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var viewState: ViewState = ViewState.ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    @Published var isShowingPopularMovies = true
    
    public func updateSearchText(with text: String) {
        setViewState(to: .loading)
        
        if text.count > 0 {
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true // keep showing popular movies
        }
    }
    
    private func getPopularMovies() {
        popularMovies = generateMovies(40)
    }
    
    private func getSearchResults(forText text: String) {
        let haveResult = Int.random(in: 0...3) // set 0 with 25%
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                // empty view
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                // ready view
                let movies = generateMovies(21)
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
}

enum ViewState {
    case empty
    case loading
    case ready
    case error
}
