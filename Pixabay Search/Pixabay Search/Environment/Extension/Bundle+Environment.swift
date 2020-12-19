//
//  Bundle+Environment.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 19/12/20.
//

import Foundation

extension Bundle{
    func value(for key: Environment.Key) -> String{
        guard let value = infoDictionary?[key.rawValue] as? String
        else { fatalError("\(key.rawValue) not properly configured in info plist.") }
        return value
    }
}
