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
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The server failed to reach the necessary URL"
        case .thrownError(let error):
            return "There was an error: \(error.localizedDescription)"
        case .noData:
            return "There was no data found"
        case .thrownImageError(let error):
            return "There was an error with an image: \(error.localizedDescription)"
        case .unableToDecode:
            return "There was an error when trying to load the data"
        }
    }
}
