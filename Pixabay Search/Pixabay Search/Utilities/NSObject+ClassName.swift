//
//  NSObject+ClassName.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import Foundation

extension NSObject {
    
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
    
}
