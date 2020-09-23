//
//  PostError.swift
//  RedditMASTER
//
//  Created by Austin Goetz on 9/22/20.
//

import Foundation

enum PostError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case thrownImageError(Error)
    case unableToDecode
}
