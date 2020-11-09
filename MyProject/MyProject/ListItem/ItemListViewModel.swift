//
//  ItemListViewModel.swift
//  MyProject
//
//  Created by p.grechikhin on 09.11.2020.
//

import Foundation

protocol ItemListViewModel {
    var itemsArray: [Item] { get }
    
    func viewReady()
    func change(item: Item)
    func addItem(with item: Item)
    func remove(item: Item)
}

class ItemListViewModelImpl: ItemListViewModel {
    var itemsArray: [Item] = []
    
    let defaults = Defaults.shared
    
    func viewReady() {
        guard let items = defaults.getObject(with: .kItems) else { return }
        itemsArray = items
    }
    
    func change(item: Item) {
        itemsArray = itemsArray
            .map { (itemInArray) -> Item in
                if itemInArray.id == item.id {
                    return item
                }
                return itemInArray
            }
        defaultsUpdate()
    }
    
    func addItem(with item: Item) {
        itemsArray.append(item)
        defaultsUpdate()
    }
    
    func remove(item: Item) {
        itemsArray.removeAll(where: { $0.id == item.id })
        defaultsUpdate()
    }
    
    
    //MARK: - Private
    
    private func defaultsUpdate() {
        defaults.set(itemsArray, for: .kItems)
    }
    
}
