//
//  PagerView.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/13.
//

import SwiftUI

// use generics
struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                content
                    .frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geometry.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        translation = value.translation.width
                    })
                    .onEnded({ value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(currentIndex) - offset).rounded()
                        currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
                        translation = 0
                    })
            )
        }
    }
}

struct PagerDummy: View {
    @State private var currentIndex: Int = 0
    @State private var translation: CGFloat = .zero
    
    var body: some View {
        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
            Color.red
            Color.blue
            Color.black
        }
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerDummy()
    }
}
