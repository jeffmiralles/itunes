//
//  MockItunesAPIService.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/4/21.
//

import Foundation
import Alamofire

class MockItunesAPIService: ItunesAPIServiceProtocol {
    var shouldReturnError = false
    
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        if !shouldReturnError {
            completion(AFDataResponse<Items>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Alamofire.AFResult.success(Mock.items)))
        } else {
            completion(AFDataResponse<Items>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Alamofire.AFResult.failure(AFError.sessionTaskFailed(error: NSError(domain: NSURLErrorDomain, code: NSURLErrorNotConnectedToInternet, userInfo: nil)))))
        }
    }
}
