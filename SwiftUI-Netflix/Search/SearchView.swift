//
//  SearchView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/11.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
