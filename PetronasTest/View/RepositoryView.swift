//
//  RepositoryView.swift
//  PetronasTest
// 
//  Created by Fateh Khan on 15/04/2021.
//

import SwiftUI

struct RepositoryView : View {
    let githunRepository: Repository
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "doc.text")
                    .foregroundColor(.blue)
                Text(githunRepository.full_name)
                    .bold()
            }
            Text(githunRepository.full_name)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.trailing)
            
            Text(githunRepository.description ?? "")
                .lineLimit(2)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(githunRepository.stargazers_count)")
                Spacer()
                Text(githunRepository.language ?? "")
                    .foregroundColor(.green)
            }
            .padding(.vertical)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.4), radius: 8, x: 0, y: 4))
    }
}
