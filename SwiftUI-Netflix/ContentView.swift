//
//  ContentView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/05/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    @State private var previewCurrentPos: CGFloat = 1000
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(showPreviewFullScreen: $showPreviewFullScreen,
                         previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                ComingSoon()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
            }
            .accentColor(.white)
            
            PreviewList(movies: exampleMovies,
                        currentSelection: $previewStartingIndex,
                        isVisible: $showPreviewFullScreen)
            .offset(y: previewCurrentPos)
            .isHidden(!showPreviewFullScreen)
            .animation(.easeIn)
            .transition(.move(edge: .bottom))
        } //: ZStack
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show fullscreen
                withAnimation {
                    previewCurrentPos = .zero
                }
            } else {
                // hiding
                withAnimation {
                    previewCurrentPos = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
