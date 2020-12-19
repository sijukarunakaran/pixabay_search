//
//  Environment.swift
//  Pixabay Search
//
//  Created by Siju on 03/05/19.
//  Copyright © 2019 SijuKarunakaran. All rights reserved.
//

import UIKit

public protocol APIHostProtocol {
    var baseURLString: String { get set }
    var version: String? { get set }
    var clientID: String? { get set }
    var clientSecret: String? { get set }
    var accessKey : String? { get set }
}

public extension APIHostProtocol {
    var baseURL: URL {
        guard var url = URL(string: baseURLString) else {
            fatalError("Bad Base URL")
        }
        if let v = version{
            url.appendPathComponent(v)
        }
        return url
    }
    var token:String?{
        return "eyJhbGciOiJIUzUxMiJ9.eyJ1c2VybmFtZSI6ImFraGlsLmtyaXNobmFuQG1vemFudGEuY29tIiwicGFzc3dvcmQiOiIxMjM0NTYifQ.yZfkD84F_lmfcUH876cigd5w-qJMjdV3zvszdMfLAR1S1c4J4Vh6JYvGdT4BPpOvPwfuBsGWz09JklYW2lV0jQ"
    }
}

struct APIHost: APIHostProtocol  {
    var baseURLString: String = "https://pixabay.com/api"
    
    var version: String? = ""
    
    var clientID: String? = ""
    
    var clientSecret: String? = ""
    
    var accessKey: String? = "19561746-e12459bfafea98a60b14037b6&q"
    
}

let host = APIHost()
