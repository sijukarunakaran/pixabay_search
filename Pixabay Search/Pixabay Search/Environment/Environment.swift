//
//  Environment.swift
//  Pixabay Search
//
//  Created by Siju on 03/05/19.
//  Copyright © 2019 SijuKarunakaran. All rights reserved.
//

import UIKit

extension Bundle{
    func value(for key: Environment.Key) -> String{
        guard let value = infoDictionary?[key.rawValue] as? String
        else { fatalError("\(key.rawValue) not properly configured in info plist.") }
        return value
    }
}

struct Environment {
    
    enum Key: String{
        case apiBaseUrl = "API_BASE_URL"
        case apiKey = "API_KEY"
    }
    
    static let apiBaseUrl: String = {
        return Bundle.main.value(for: .apiBaseUrl)
    }()
    
    static let apiKey: String = {
        return Bundle.main.value(for: .apiKey)
    }()
}
