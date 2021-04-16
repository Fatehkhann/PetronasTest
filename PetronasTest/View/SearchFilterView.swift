//
//  SearchFilterView.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import SwiftUI

struct SearchFilterView: View {
    @Binding var showFilter: Bool
    @Binding var selectedLanguage: String
    @Binding var selectedTopic: String
    var languagesList = ["Javascript", "Swift", "Kotlin", "C#", "Python", "Java", "PHP", "Go", "C++"]
    var topicsList = ["react", "android", "nodejs", "iphone", "ruby", "theme", "wordpress"]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showFilter.toggle()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            Text("Search by Language:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(languagesList, id: \.self) { languageName in
                        Text(languageName)
                            .foregroundColor(languageName == selectedLanguage ? Color.white : Color.black)
                            .padding()
                            .background(Capsule().fill(languageName == selectedLanguage ? Color.green : Color.gray.opacity(0.4)))
                            .onTapGesture {
                                selectedLanguage = languageName
                            }
                    }
                }
            }
            Text("Search by Topic:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(topicsList, id: \.self) { topicName in
                        Text(topicName)
                            .foregroundColor(topicName == selectedTopic ? Color.white : Color.black)
                            .padding()
                            .background(Capsule().fill(topicName == selectedTopic ? Color.green : Color.gray.opacity(0.4)))
                            .onTapGesture {
                                selectedTopic = topicName
                            }
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.green.opacity(0.4)))
    }
}

