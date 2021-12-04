//
//  MockItunesRepositories.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/4/21.
//

import Foundation
import Alamofire

class MockItunesRepositories: ItunesRepositoriesProtocol {
    
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        let response = AFDataResponse<Items>(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: 0, result: Alamofire.AFResult.success(Mock.items))
        DispatchQueue.main.async {
            completion(response)
        }
    }
}
