//
//  APIErrorResponse.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//

import UIKit

public protocol APIErrorResponse: Decodable {
    var errorMessage: String{ get }
}
