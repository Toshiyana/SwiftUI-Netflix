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
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                // VERTICAL ONLY
                let shouldBePosition = value.translation.height + previewNewPos
                
                if shouldBePosition < 0 {
                    return
                } else {
                    previewCurrentPos = shouldBePosition
                }
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + previewNewPos
                
                if shouldBePosition < 0 {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                } else {
                    let closingPoint = screen.size.height * 0.2
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            showPreviewFullScreen = false
                            previewCurrentPos = screen.height + 20
                            previewNewPos = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            previewNewPos = .zero
                            previewCurrentPos = .zero
                        }
                    }
                }
                
                previewHorizontalDragActive = false
            }
        
        return ZStack {
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
                        isVisible: $showPreviewFullScreen,
                        externalDragGesture: previewDragGesture)
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
                    previewNewPos = .zero
                }
            } else {
                // hiding
                withAnimation {
                    previewCurrentPos = screen.height + 20
                    previewNewPos = screen.height + 20
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
