//
//  RepositoryListView.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import SwiftUI

struct RepositoryListView : View {
    
    @ObservedObject var githubAPIViewModel: SearchRepoViewModel
    @State var selectedRepositoryURL = URL(string: "github.com")
    @State var showSearchFilter = false
    @State var showRepositoryDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        HStack {
                            TextField("Search reposipories...", text: $githubAPIViewModel.searchString)
                                .frame(height: 40)
                                .padding()
                                .padding(.horizontal, 16)
                            
                            Button(action: {
                                self.githubAPIViewModel.searchThroughGithub()
                                
                            }) {
                                Image(systemName: "magnifyingglass.circle")
                                    .font(.title)
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }
                        .background(Capsule()
                                        .fill(Color.green.opacity(0.1)).padding(8))
                    }
                    
                    NavigationLink(
                        destination: WebView(url: selectedRepositoryURL!),
                        isActive: $showRepositoryDetail) {
                        EmptyView()
                    }
                    ScrollView(showsIndicators: false) {
                        if githubAPIViewModel.isLoading {
                            Text("Loading...")
                        } else {
                            
                            LazyVStack {
                                ForEach(githubAPIViewModel.githubRepositories) { value in
                                    RepositoryView(githunRepository: value)
                                        .padding()
                                        .onTapGesture {
                                            selectedRepositoryURL = URL(string: value.html_url)!
                                        }
                                }
                            }
                        }
                    }
                    .navigationBarTitle(Text("Search Github"))
                    .navigationBarItems(trailing: Button(action: {
                        withAnimation {
                            self.showSearchFilter.toggle()
                        }
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.black)
                    })
                }
                .onAppear(perform: {
                    print(githubAPIViewModel.repositoryTopic)
                })
                .blur(radius: showSearchFilter ? 6.0 : 0.0)
                if (showSearchFilter) {
                    SearchFilterView(showFilter: $showSearchFilter, selectedLanguage: $githubAPIViewModel.repositoryLanguage, selectedTopic: $githubAPIViewModel.repositoryTopic)
                        .padding()
                }
            }
        }
    }
}
