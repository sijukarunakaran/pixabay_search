//
//  APIHeader.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//

import UIKit

public struct APIHeader: Encodable {
    
    public enum AuthenticationKey: String {
        case bearer = "Bearer"
        case clientID = "Client-ID"
    }
    
    let authentication: String?
    let authenticationKey: String
    let contentType: String
    let acceptType: String
    let acceptEncoding: String?
    let apiKey: String?
    let secret: String?
    
    enum CodingKeys: String, CodingKey {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case apiKey = "apiKey"
        case secret = "secret"
    }
    
    public init(authentication: String? = nil,
                authenticationKey: AuthenticationKey = APIHeader.AuthenticationKey.bearer,
                contentType: String = ContentType.json,
                acceptType: String = ContentType.json,
                acceptEncoding: String? = nil,
                apiKey: String? = nil,
                secret: String? = nil) {
        self.authentication = authentication
        self.contentType = contentType
        self.acceptType = acceptType
        self.acceptEncoding = acceptEncoding
        self.authenticationKey = authenticationKey.rawValue
        self.apiKey = apiKey
        self.secret = secret
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let authorization = authentication{
            try container.encodeIfPresent("\(authenticationKey) \(authorization)", forKey: .authentication)
        }
        try container.encodeIfPresent(contentType, forKey: .contentType)
        try container.encodeIfPresent(acceptType, forKey: .acceptType)
        try container.encodeIfPresent(acceptEncoding, forKey: .acceptEncoding)
        try container.encodeIfPresent(apiKey, forKey: .apiKey)
        try container.encodeIfPresent(secret, forKey: .secret)

    }
}

