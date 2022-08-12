//
//  CommingSoon.swift
//  SwiftUI-Netflix
//
//  Created by Toshiyana on 2022/08/12.
//

import SwiftUI

struct ComingSoon: View {
    @State private var showNotficationList = false
    @State private var navBarHidden = true
    
    var body: some View {
//        NavigationView {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        VStack {
                            NotificationBar(showNotificationList: $showNotficationList)
                            
                            Text("For each loop of cells")
                        }
                    }
                    .foregroundColor(.white)
                } //: ZStack
                
                NavigationLink(destination: Text("Notifications List"),
                               isActive: $showNotficationList,
                               label: {
                    EmptyView()
                })
                .navigationTitle("")
                .navigationBarHidden(navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                    self.navBarHidden = true
                })
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    self.navBarHidden = false
                })
            }//: Group
//        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
