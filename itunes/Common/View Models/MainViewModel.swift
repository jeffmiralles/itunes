//
//  MainViewModel.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/2/21.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var items: Items?
    
    private let repository: ItunesRepositoriesProtocol
    
    init(repository: ItunesRepositoriesProtocol = ItunesRepositories()) {
        self.repository = repository
    }
    
    func search() {
        repository.searchTerm(query: "star") { apiResponse in
            switch apiResponse.result {
            case.success(let items):
                self.items = items
            case .failure(let error):
                print(error)
            }
        }
    }
}
