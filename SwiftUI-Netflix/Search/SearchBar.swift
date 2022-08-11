//
//  SearchBar.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/11.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = true
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 290, height: 36)
                .cornerRadius(8)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .frame(height: 36)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture {
                        isEditing = true
                    }
                
                if !text.isEmpty {
                    if isLoading {
                        ActivityIndicator(style: .medium, animate: .constant(true))
                            .configure {
                                $0.color = .white
                            }
                            .frame(width: 35, height: 35)
                    } else {
                        Button(action: {
                            // clear text
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 35)
                        })
                    }
                }
                
                if isEditing {
                    Button(action: {
                        // clear text, hide both buttons, give up first-responder
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.leading, 10)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant(""), isLoading: .constant(false))
        }
    }
}
