//
//  APIError.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//

import Foundation

public enum PSError: Error {
    case encoding
    case decoding
    case badURL
    case server(message: String)
    case noSuffientData
}
extension PSError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decoding:
            return "JSON Decode Error"
        case .encoding:
            return "JSON Encode Error"
        case .server(let message):
            return message
        case .badURL:
            return "Bad URL"
        case .noSuffientData:
            return "No Sufficient Data"
        }
    }
}
