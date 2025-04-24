//
//  QError.swift
//  Quizzard-Storyboard
//

import Foundation

enum QError: Error {
    case network(message: String)
    case jsonDecoding
    case user(message: String)
}

// MARK: - LocalizedError

extension QError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .jsonDecoding:
            return "The data is not in the correct format."
        case .network(let message),
                .user(let message):
            return message
        }
    }
    
}
