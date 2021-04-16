//
//  Repository.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import Foundation

struct Repository: Hashable, Identifiable, Decodable {
    var id: Int64
    var name: String
    var full_name: String
    var html_url: String
    var description: String?
    var stargazers_count: Int
    var language: String?
}
