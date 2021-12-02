//
//  ItunesRepositories.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Foundation
import Alamofire

protocol ItunesRepositoriesProtocol {
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void)
}

final class ItunesRepositories: ItunesRepositoriesProtocol {
    
    private let apiService: ItunesAPIServiceProtocol
    
    init(apiService: ItunesAPIServiceProtocol = ItunesAPIService()) {
        self.apiService = apiService
    }
    
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        apiService.searchTerm(query: query, completion: completion)
    }
    
}
