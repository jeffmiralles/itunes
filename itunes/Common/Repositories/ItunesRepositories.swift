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
    // MARK: - Properties
    private let apiService: ItunesAPIServiceProtocol
    
    // MARK: - Init
    init(apiService: ItunesAPIServiceProtocol = ItunesAPIService()) {
        self.apiService = apiService
    }
    
    // MARK: - Functions
    func searchTerm(query: String, completion: @escaping (AFDataResponse<Items>) -> Void) {
        apiService.searchTerm(query: query, completion: completion)
    }
    
}
