//
//  Post.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import Foundation

struct TopLevelDictionary {
    let data: SecondLevelDictionary
}

struct SecondLevelDictionary {
    let children: [ThirdLevelDictionary]
}

struct ThirdLevelDictionary {
    let data: Post
}

struct Post {
    let title: String
    let ups: Int
    let thumbnail: URL?
}
