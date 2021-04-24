//
//  ContentView.swift
//  Shared
//
//  Created by Connor Shea on 4/23/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("vglist")
                .font(.title)
                .fontWeight(.medium)
                .padding(EdgeInsets(top: 50, leading: 5, bottom: 10, trailing: 5))
            Text("Track your entire video game library across every store and platform.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 50)
            Spacer()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
    }
}

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
