//
//  ItunesAPIService.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Foundation
import Alamofire

protocol ItunesAPIServiceProtocol {
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void)
}

final class ItunesAPIService: ItunesAPIServiceProtocol {
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        SearchAPI.searchTerm(query: query, completion: completion)
    }
}
