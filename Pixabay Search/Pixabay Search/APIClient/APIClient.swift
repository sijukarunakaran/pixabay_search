//
//  APIClient.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//


import Foundation
import UIKit

public typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

/// Implementation of a generic-based API client
public class APIClient {
    
    
	private let session = URLSession(configuration: .default)
    public init() {
        
    }

	/// Sends a request to server, calling the completion method when finished
	public func perform<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.SuccessResponseType>) {
        let urlRequest = request.urlRequest
		let task = session.dataTask(with: urlRequest) { data, response, error in
			if let data = data {
                self.decode(request, data: data, completion: completion)
			} else if let error = error {
				completion(.failure(error))
			}
		}
		task.resume()
	}
    
    /// Decode data based on the given request
    private func decode<T: APIRequest>(_ request: T, data: Data, completion: @escaping ResultCallback<T.SuccessResponseType>) {
        
        let apiResponse = Result{ try JSONDecoder().decode(T.SuccessResponseType.self, from: data) }
        
        switch apiResponse {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
                print(error)
        }
    }
    
    public func cancel<T: APIRequest>(_ request: T) {
      URLSession.shared.getAllTasks { tasks in
        tasks
          .filter { $0.state == .running }
            .filter { $0.originalRequest == request.urlRequest }.first?
          .cancel()
      }
    }
    
}
