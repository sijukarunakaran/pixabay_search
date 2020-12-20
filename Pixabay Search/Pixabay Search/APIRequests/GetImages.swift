//
//  GetImages.swift
//  Pixabay Search
//
//  Created by Siju on 18/12/20.
//

import Foundation

struct GetImages: APIRequest {
    
    struct QueryParams: Encodable {
        let key: String = Environment.apiKey
        let keyword: String
        let page: Int
        
        enum CodingKeys: String, CodingKey{
            case key
            case keyword = "q"
            case page
        }
    }
    
    typealias SuccessResponseType = ImageSearchResponse
    
    typealias QueryParamsType = QueryParams
    
    typealias BodyType = Identity
    
    var baseEndpointUrl: URL { Environment.apiBaseUrl }
    
    var method: HTTPMethod { .get }
    
    var resourceName: String? { nil }
    
    var queryParams: QueryParams?
    
    var body: Identity? = nil
    
    var header: APIHeader? { nil }
    
}
