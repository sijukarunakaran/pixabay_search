//
//  Observer.swift
//  Pixabay Search
//
//  Created by Siju on 21/01/20.
//  Copyright © 2020 Siju. All rights reserved.
//

import UIKit

public protocol ObserverProtocol {}
public extension ObserverProtocol{
    
    var id: Int{
        return UUID().hashValue
    }
    
}

