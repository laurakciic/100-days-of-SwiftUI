//
//  Result.swift
//  14_BucketList
//
//  Created by Laura on 04.10.2022..
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]              // pages dict - pageid as key (Wikipedia's internal identifier), wikipedia pages as values
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?      // dictionary with strings as keys + array of optional strings as values
}
