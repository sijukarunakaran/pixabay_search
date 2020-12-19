//
//  Environment.swift
//  Pixabay Search
//
//  Created by Siju on 03/05/19.
//  Copyright © 2019 SijuKarunakaran. All rights reserved.
//

import Foundation

struct Environment {
    
    enum Key: String{
        case apiBaseUrl = "API_BASE_URL"
        case apiKey = "API_KEY"
    }
    
    static let apiBaseUrl: URL = {
        guard let url = URL(string: Bundle.main.value(for: .apiBaseUrl)
                                .replacingOccurrences(of: "\\", with: ""))
        else { fatalError("\(Key.apiBaseUrl.rawValue) is not a properly URL.") }
        return url
    }()
    
    static let apiKey: String = {
        return Bundle.main.value(for: .apiKey)
    }()
}
