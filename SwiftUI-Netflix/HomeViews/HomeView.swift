//
//  HomeView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/07.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    TopRowButtons()
                    
                    TopMoviePreview(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                        .zIndex(-1)
                 
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color.white)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(vm.getMovie(forCategory: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image("netflix_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("TV Shows")
                    .foregroundColor(.white)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Movies")
                    .foregroundColor(.white)
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("My List")
                    .foregroundColor(.white)
            })
            .buttonStyle(PlainButtonStyle())
        } //: HStack
        .padding(.leading, 10)
        .padding(.trailing, 30)
    }
}
