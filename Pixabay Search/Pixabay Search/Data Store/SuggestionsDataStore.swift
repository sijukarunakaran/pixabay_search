//
//  SuggestionsDataStore.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

class SuggestionsDataStore: DataStore{
    typealias DataType = String
    
    typealias DataTypeCollection = [String]
    private let key = "Suggestions_key"
    func getAll(_ completion: @escaping (() throws -> DataTypeCollection) -> Void) {
        completion{
            UserDefaults.standard.array(forKey: key) as? [String] ?? []
        }
    }

    func create(_ item: String, completion: @escaping (() throws -> String) -> Void) {
        var items = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        if !items.contains(item){
            items.insert(item, at: 0)
            UserDefaults.standard.setValue(item.count > 10 ? items[0..<10] : items, forKey: key)
            UserDefaults.standard.synchronize()
        }
        completion{ item }
    }
    
    
}
