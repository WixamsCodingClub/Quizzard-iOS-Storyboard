//
//  QError.swift
//  Quizzard-Storyboard
//

import Foundation

enum QError: Error {
    case network(message: String)
    case jsonDecoding(message: String)
    case user(message: String)
}

// MARK: - LocalizedError

extension QError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .jsonDecoding(let message),
                .network(let message),
                .user(let message):
            return message
        }
    }
    
}
