//
//  RepositoryListViewModel.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import Combine
import SwiftUI

final class SearchRepoViewModel: ObservableObject {
    
    @Published var searchString = "java"
    @Published var repositoryLanguage = ""
    @Published var repositoryTopic = ""
    @Published var isLoading = false
    @Published var searchesRecord = [String]()
    @Published var githubRepositories = [Repository]()
    
    
    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        searchCancellable?.cancel()
    }
    
    func searchThroughGithub() {
        var searchTerm = searchString
        if repositoryLanguage.count > 0 {
            searchTerm += " language:\(repositoryLanguage)"
        }
        if repositoryTopic.count > 0 {
            searchTerm += " topic:\(repositoryTopic)"
        }
        searchesRecord.append(searchTerm)
//        print(searchesRecord.count)
        beginSearching(searchTerm: searchTerm)
    }
    
    func beginSearching(searchTerm: String) {
        isLoading.toggle()
        guard !searchString.isEmpty else {
            return githubRepositories = []
        }
        
        var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: searchTerm)
        ]
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: ItemResponse.self, decoder: JSONDecoder())
            .map { DispatchQueue.main.async {
                self.isLoading.toggle()
            }
            return $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.githubRepositories, on: self)
    }
}
