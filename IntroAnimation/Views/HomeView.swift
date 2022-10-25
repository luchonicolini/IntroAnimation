//
//  HomeView.swift
//  IntroAnimation
//
//  Created by Luciano Nicolini on 24/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("hola")
                .navigationTitle("HomeView")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
