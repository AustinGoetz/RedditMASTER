//
//  Post.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let data: SecondLevelDictionary
}

struct SecondLevelDictionary: Decodable {
    let children: [ThirdLevelDictionary]
}

struct ThirdLevelDictionary: Decodable {
    let data: Post
}

struct Post: Decodable {
    let title: String
    let ups: Int
    let thumbnail: URL?
}
