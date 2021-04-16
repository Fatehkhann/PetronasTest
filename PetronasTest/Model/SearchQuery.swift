//
//  SearchQuery.swift
//  PetronasTest
//
//  Created by Fateh Khan on 16/04/2021.
//

import Foundation

struct SearchQuery {
    var topic: String?
    var language: String?
    var keyword: String?
    
    init(queryString: String) {
        if(queryString.split(separator: " ").count > 0) {
            keyword = String(queryString.split(separator: " ")[0])
            if(queryString.split(separator: " ").count > 1) {
                if(queryString.split(separator: " ")[1].contains("language")) {
                    language = String(queryString.split(separator: " ")[1].split(separator: ":")[1])
                } else if(queryString.split(separator: " ")[1].contains("topic")) {
                    topic = String(queryString.split(separator: " ")[1].split(separator: ":")[1])
                }
                if(queryString.split(separator: " ").count>2) {
                    topic = String(queryString.split(separator: " ")[2].split(separator: ":")[1])
                }
            }
        } else {
            keyword = queryString
            topic = ""
            language = ""
        }
    }
}
