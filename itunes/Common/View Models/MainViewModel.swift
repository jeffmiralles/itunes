//
//  MainViewModel.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Foundation

/// Main View Model
final class MainViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var items = Items(resultCount: 0, results: [])
    
    // MARK: - Properties
    private let repository: ItunesRepositoriesProtocol
    
    // MARK: - Init
    
    // Making the type conforms to a protocol make this class testable together with mocks.
    init(repository: ItunesRepositoriesProtocol = ItunesRepositories()) {
        self.repository = repository
        search()
    }
    
    // MARK: - Functions
    
    /// Search for a term. Response will be of type `Items`
    func search() {
        repository.searchTerm(query: "star") { apiResponse in
            switch apiResponse.result {
            case .success(let items):
                self.items = items
            case .failure(let error):
                print(error)
            }
        }
    }
}
