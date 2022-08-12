//
//  DownloadsView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/13.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart Downloads")
                    Text("ON")
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75)
                        .foregroundColor(.gray)
                }
                .frame(height: 275)
                .padding(.top, 50)
                
                VStack(spacing: 20) {
                    Text("Never be without Netfilx")
                        .font(.title2)
                        .bold()
                    Text("Download shows and movies so you'll never be without something to watch\n-- even when you're offline")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
                    Button(action: {
                        // Show shows that can be downloaded
                    }, label: {
                        Text("See What You Can Download")
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                    })
                }
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            DownloadsView()
        }
    }
}
