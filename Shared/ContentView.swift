//
//  ContentView.swift
//  Shared
//
//  Created by Connor Shea on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("vglist")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.all, 5)
            Text("Track your entire video game library across every store and platform.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
