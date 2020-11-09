//
//  ItemModel.swift
//  MyProject
//
//  Created by  Alex on 31.10.2020.
//

import Foundation

struct Item: Codable {
    let id = UUID().uuidString
    var title: String
    var subTitle: String?
    
    
    mutating func change(title withNewTitle: String) {
        self.title = withNewTitle
    }
    
    mutating func change(subtitle withNewSubtitle: String) {
        self.subTitle = withNewSubtitle
    }
    
}
