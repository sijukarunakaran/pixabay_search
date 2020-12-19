//
//  Encodable+Dictionary.swift
//  Pixabay Search
//
//  Created by Siju on 19/09/19.
//  Copyright © 2019 Siju. All rights reserved.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
