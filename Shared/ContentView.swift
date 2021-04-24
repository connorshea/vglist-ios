//
//  ContentView.swift
//  Shared
//
//  Created by Connor Shea on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag(1)

            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }.tag(2)

            ProfileView().tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }.tag(3)
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
