//
//  URLQueryItemEncoder.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//
//


import Foundation

/// Encodes any encodable to a URLQueryItem list
enum URLQueryItemEncoder {
	static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
		let parametersData = try JSONEncoder().encode(encodable)
		let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
		return parameters.map { URLQueryItem(name: $0, value: $1.description) }
	}
}
