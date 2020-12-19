//
//  APIRequest.swift
//  Pixabay Search
//
//  Created by Siju on 26/08/19.
//  Copyright © 2019 Siju. All rights reserved.
//


import Foundation

/// All requests must conform to this protocol
public protocol APIRequest {
	/// Type to decode incoming json
	associatedtype SuccessResponseType: Decodable
    /// Type to encapsulate query params
    associatedtype QueryParamsType: Encodable
    /// Type to encapsulate body
    associatedtype BodyType: Encodable
    
    ///Api http method
    var baseEndpointUrl: URL { get }
    ///Api http method
    var method: HTTPMethod { get }
	/// Endpoint for this request (the last part of the URL)
	var resourceName: String? { get }
    /// Query params
    var queryParams: QueryParamsType? { set get }
    /// Request body
    var body: BodyType? { set get }
    ///Header fields
    var header: APIHeader? { get }
    
}


extension APIRequest {
    
    var urlRequest: URLRequest {
        let endpoint = self.endpoint()
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.header?.dictionary as? [String : String]
        urlRequest.httpBody = bodyParams()
        return urlRequest
    }
    
    /// Encodes request body based on the given request
    private func bodyParams() -> Data?{
        guard let bodyParams = self.body else{
            return nil
        }
        do {
            return try JSONEncoder().encode(bodyParams)
        } catch {
            fatalError("Wrong parameters: \(error)")
        }
    }
    
    /// Encodes a URL based on the given request
    private func endpoint() -> URL {
        
        var baseUrl = baseEndpointUrl
        if let path = self.resourceName{
            baseUrl = baseUrl.appendingPathComponent(path)
        }
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        
        // Common query items needed for all requests
        let commonQueryItems = [URLQueryItem]()

        //TODO If any common query mention here

        // Custom query items needed for this specific request
        let customQueryItems: [URLQueryItem]
        if let params = self.queryParams{
            do {
                customQueryItems = try URLQueryItemEncoder.encode(params)
            } catch {
                fatalError("Wrong parameters: \(error)")
            }
            components.queryItems = commonQueryItems + customQueryItems
        }
        
        
        // Construct the final URL with all the previous data
        return components.url!
    }
}
