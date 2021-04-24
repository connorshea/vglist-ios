//
//  HomeView.swift
//  vglist
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
