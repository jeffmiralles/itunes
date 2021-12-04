//
//  Mock.swift
//  itunes
//
//  Created by Jefferson Miralles on 12/4/21.
//

import Foundation

enum Mock {
    static var items: Items {
        let jsonString = try! String(contentsOf: Bundle.main.url(forResource: "items", withExtension: "json")!)
        let items = try! JSONDecoder().decode(Items.self, from: jsonString.data(using: .utf8)!)
        return items
    }
}
