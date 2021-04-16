//
//  PetronasTestApp.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import SwiftUI

@main
struct PetronasTestApp: App {
    let githubViewModel = SearchRepoViewModel()
    @State private var tabSelection = 1
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabSelection) {
                RepositoryListView(githubAPIViewModel: githubViewModel)
                    .tabItem {
                        Label("Search", systemImage: "doc.text.magnifyingglass")
                    }
                    .tag(1)
                AdminView(githubAPIViewModel: githubViewModel, selectedTab: $tabSelection)
                    .tabItem {
                        Label("Stats", systemImage: "list.bullet.below.rectangle")
                    }
                    .tag(2)
            }
        }
    }
}
