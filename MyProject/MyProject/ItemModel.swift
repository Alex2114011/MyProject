//
//  ItemModel.swift
//  MyProject
//
//  Created by  Alex on 31.10.2020.
//

import Foundation

class Items: Codable {
    var title: String
    var subTitle: String?
    
    init(title: String, subTitle: String?) {
        self.title = title
        self.subTitle = subTitle
    }
}
