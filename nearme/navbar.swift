//
//  SwiftUIView.swift
//  nearme
//
//  Created by Meghna Sampath on 7/31/24.
//

import SwiftUI

struct navbarView: View {
    var body: some View {
        //        NavigationStack {
        //            VStack {
        //                Text("Nav View")
        //            }
        //            .toolbar {
        //                NavigationLink(destination: EventListView()) {
        //                    Text("About")
        //                }
        //                }
        TabView {
            EventListView()
                .tabItem() {
                    Image(systemName: "homekit")
                    Text("Home Events")
                }
            profilePage()
                .tabItem() {
                    Image(systemName: "person.2.circle")
                    Text("Profile")
                }
            camerascanid()
                .tabItem() {
                    Image(systemName: "camera")
                    Text("Camera")
                }
        }
    }
}


#Preview {
    navbarView()
}
