//
//  ComingSoonRow.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/12.
//

import SwiftUI
import Kingfisher
import AVKit

struct ComingSoonRow: View {
    var movie: Movie
    
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    // player for testing
    var player: AVPlayer {
        AVPlayer(url: URL(string: "https://www.radiantmedisplayer.com/media/bug-buck.bunny-360p.mp4")!)
    }
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width / 3, height: 75)
                        .clipped()
                    
                    Spacer()
                    
                    Button(action: {
                        // remind me
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        movieDetailToShow = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing, 24)
                } //: HStack
            } //: VStack
            .font(.caption)
            
            VStack(alignment: .leading) {
                Text(movie.name)
                    .font(.title2)
                    .bold()
                
                Text(movie.episodeDescriptionDisplay)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        } //: VStack
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
    }
}
