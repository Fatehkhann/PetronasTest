//
//  ContentView.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import SwiftUI

struct AdminView: View {
    @ObservedObject var githubAPIViewModel: SearchRepoViewModel
    @Binding var selectedTab: Int
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(showsIndicators: false) {
                        
                        LazyVStack {
                            ForEach(githubAPIViewModel.searchesRecord, id: \.self) { value in
                                SearchRecord(searchString: value) {
                                    withAnimation {
                                        self.selectedTab = 1
                                        print(value)
                                    }
                                    if(value.split(separator: " ").count > 0) {
                                        githubAPIViewModel.searchString = String(value.split(separator: " ")[0])
                                        githubAPIViewModel.repositoryTopic = ""
                                        githubAPIViewModel.repositoryLanguage = ""
                                        if(value.split(separator: " ").count > 1) {
                                            if(value.split(separator: " ")[1].contains("language")) {
                                                githubAPIViewModel.repositoryLanguage = String(value.split(separator: " ")[1].split(separator: ":")[1])
                                            } else if(value.split(separator: " ")[1].contains("topic")) {
                                                githubAPIViewModel.repositoryTopic = String(value.split(separator: " ")[1].split(separator: ":")[1])
                                            }
                                            if(value.split(separator: " ").count>2) {
                                                githubAPIViewModel.repositoryTopic = String(value.split(separator: " ")[2].split(separator: ":")[1])
                                            }
                                        }
                                    } else {
                                        githubAPIViewModel.searchString = value
                                    }
//                                    self.githubAPIViewModel.searchThroughGithub()
                                }
                                .id(UUID())
                                .padding()
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Stats"))
            }
        }
    }
}



struct SearchRecord : View {
    let searchString: String
    @State var keyword = ""
    @State var language = ""
    @State var topic = ""
    
    let tapAction: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                Text(keyword)
                    .font(.title)
            }
            
            HStack {
                Image(systemName: "chevron.left.slash.chevron.right")
                    .foregroundColor(.blue)
                Text("Language: \(language)")
                Spacer()
            }
            
            HStack {
                Image(systemName: "square.grid.4x3.fill")
                    .foregroundColor(.green)
                Text("Topic: \(topic)")
                Spacer()
            }
            .onAppear {
                if(searchString.split(separator: " ").count > 0) {
                    keyword = String(searchString.split(separator: " ")[0])
                    print(searchString.split(separator: " "))
                    if(searchString.split(separator: " ").count > 1) {
                        if(searchString.split(separator: " ")[1].contains("language")) {
                            language = String(searchString.split(separator: " ")[1].split(separator: ":")[1])
                        } else if(searchString.split(separator: " ")[1].contains("topic")) {
                            topic = String(searchString.split(separator: " ")[1].split(separator: ":")[1])
                        }
                        if(searchString.split(separator: " ").count>2) {
                            topic = String(searchString.split(separator: " ")[2].split(separator: ":")[1])
                        }
                    }
                } else {
                    keyword = searchString
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4))
        .onTapGesture {
            tapAction()
        }
    }
}
