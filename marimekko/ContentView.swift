//
//  ContentView.swift
//  marimekko
//
//  Created by Roman Zakharov on 19.11.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView{
                ExploreView()
                    .navigationBarTitle("Explore")
            }
            .tabItem {
                Label("Explore", systemImage: "star")
            }

            NavigationView{
                RewardsView()
                    .navigationBarTitle("Rewards")
            }
            .tabItem {
                Label("Rewards", systemImage: "gift")
            }

            NavigationView{
                HomeView()
                    .navigationBarTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView{
                MariView()
                    .navigationBarTitle("mARi", displayMode: .inline)
            }
            .tabItem {
                Label("mARi", systemImage: "arkit")
            }

            NavigationView{
                PlaceholderView()
                    .navigationBarTitle("Add post", displayMode: .inline)
            }
            .tabItem {
                Label("Post", systemImage: "plus.app.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
