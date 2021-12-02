//
//  SearchAPI.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Alamofire
import Foundation

enum SearchRequest: URLRequestConvertible {
    
    case searchTerm(query: String)
    
    var path: String {
        let searchPath = "/search"
        
        var fullPath = ""
        switch self {
        case .searchTerm(let query):
            fullPath += "\(searchPath)?term=\(query)&country=au&media=movie&all"
        }
        return fullPath
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .searchTerm:
            return .get
        }
    }
    
    var parameters: Any? {
        switch self {
        case .searchTerm:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let urlString = (clientUrl + path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw AFError.invalidURL(url: clientUrl + path)
        }
        guard let url = URL(string: urlString) else { throw AFError.invalidURL(url: urlString) }
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        if let params = parameters {
            urlRequest.httpBody =  try? JSONSerialization.data(withJSONObject: params, options: .fragmentsAllowed)
        }
        urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        return urlRequest
    }
}

enum SearchAPI {
    public static func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        AF.request(SearchRequest.searchTerm(query: query)).responseDecodable(of: Items.self,
                                                          completionHandler: completion)
    }
}
