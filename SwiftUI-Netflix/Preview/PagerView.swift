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
    
    @State private var verticalDragIsActive = false
    
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
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
                externalDragGesture.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                            .onChanged({ value in
                                
                                if verticalDragIsActive {
                                    return
                                }
                                
                                if abs(value.translation.width) < abs(value.translation.height) {
                                    verticalDragIsActive = true
                                    return
                                }
                                
                                // Horizontal Drag Onlu
                                
                                translation = value.translation.width
                            })
                            .onEnded({ value in
                                
                                if verticalDragIsActive {
                                    verticalDragIsActive = false
                                    return
                                }
                                
                                // Ending horizontal drag
                                
                                let offset = value.translation.width / geometry.size.width
                                let newIndex = (CGFloat(currentIndex) - offset).rounded()
                                currentIndex = min(max(Int(newIndex), 0), pageCount - 1)
                                translation = 0
                            })
                )
            )
        }
    }
}

//struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//    
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.red
//            Color.blue
//            Color.black
//        }
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}
