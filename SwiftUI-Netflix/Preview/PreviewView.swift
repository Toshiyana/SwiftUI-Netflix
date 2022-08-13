//
//  PreviewView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/13.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var vm: PreviewVM
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(
                videoURL: vm.movie.trailers.first?.videoURL,
                playVideo: .constant(true)
            )
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(vm.movie.name)
                            .bold()
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id: \.self) { catIndex in
                        let category = vm.movie.categories[catIndex]
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            // 最後のカテゴリの末尾にはcircle画像をつけない
                            if catIndex != vm.movie.categories.count - 1 {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        color: vm.movie.accentColor!,
                                        isOn: true) {
                        //
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("PLAY")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.movie.accentColor!, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        color: vm.movie.accentColor!,
                                        isOn: true) {
                        //
                    }
                    
                    Spacer()
                } //: HStack
                .padding(.vertical, 14)
            } //: VStack
            .padding(.bottom, 48)
            .foregroundColor(vm.movie.accentColor)
        } //: ZStack
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1))
    }
}
