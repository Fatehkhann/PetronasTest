//
//  ItemResponse.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import Foundation

//struct ItemResponse<T: Decodable>: Decodable {
//    let items: [T]
//}

struct ItemResponse: Decodable {
    var items: [Repository]
    let total_count: Int
}
