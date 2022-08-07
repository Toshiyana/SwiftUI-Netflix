//
//  MovieDetail.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/07.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // close this view
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                }
                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieInfoSubHeadline(movie: movie)
                        
                        if let promotionHeadLine = movie.promotionHeadLine {
                            Text(promotionHeadLine)
                                .bold()
                                .font(.headline)
                        }
                    }
                }
                
                Spacer()
            }//: VStack
            .foregroundColor(.white)
        }//: ZStack
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie4)
    }
}

struct MovieInfoSubHeadline: View {
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}
