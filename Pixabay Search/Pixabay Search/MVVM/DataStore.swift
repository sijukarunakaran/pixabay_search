//
//  DataStore.swift
//  Pixabay Search
//
//  Created by Siju on 07/02/20.
//  Copyright © 2020 Siju. All rights reserved.
//

import Foundation

public protocol DataStore {
    
    associatedtype DataType
    associatedtype DataTypeCollection
    
    func getAll(_ completion: @escaping (() throws -> DataTypeCollection) -> Void )
    func get( identifier: String, completion: @escaping (() throws -> DataType) -> Void )
    func create(_ item: DataType, completion: @escaping (() throws -> DataType) -> Void )
    func update(_ item: DataType, completion: @escaping (() throws -> DataType) -> Void )
    func delete(_ item: DataType, completion: @escaping (() throws -> Bool) -> Void )
    
}

public extension DataStore{
    func fetch<T: APIRequest>(_ request: T, completion: @escaping (() throws -> T.SuccessResponseType) -> Void){
        APIClient().perform(request) { (result) in
            do {
                let data = try result.get()
                completion{ return data }
            } catch  {
                
            }
        }
    }
    func getAll(_ completion: @escaping (() throws -> DataTypeCollection) -> Void ){
        fatalError("\(#function) Not implemented")
    }
    func get( identifier: String, completion: @escaping (() throws -> DataType) -> Void ){
        fatalError("\(#function) Not implemented")
        
    }
    func create(_ item: DataType, completion: @escaping (() throws -> DataType) -> Void ){
        fatalError("\(#function) Not implemented")
        
    }
    func update(_ item: DataType, completion: @escaping (() throws -> DataType) -> Void ){        fatalError("\(#function) Not implemented")
        
    }
    func delete(_ item: DataType, completion: @escaping (() throws -> Bool) -> Void ){
        fatalError("\(#function) Not implemented")
        
    }
    
}
