//
//  ItemsViewModel.swift
//  iOSRecruitmentTest
//
//  Created by user on 5/15/17.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import Foundation

class ItemsViewModel {
    var localDataManager: LocalDataManager!
    var apiDataManager: ApiDataManager!
    
    // in real project use SwiftBond for data binding
    var filtered = [Item]()
    var items = [Item]()
    var error: Error?
    var filter = ""
    
    func filter(_ filter: String, completion: @escaping () -> Void) {
        if !filter.isEmpty {
            filtered = items.filter { $0.details?.localizedCaseInsensitiveContains(filter) ?? false }
        } else {
            filtered = items
        }
        
        completion()
    }
    
    func fetchItems(completion: @escaping () -> Void) {
        localDataManager.fetchItems { (items, error) in
            self.items = items ?? []
            self.filtered = self.items
            self.error = error
            completion()
        }
    }
    
    func updateItems(completion: @escaping () -> Void) {
        apiDataManager.fetchItems { (items, error) in
            self.items = items ?? []
            self.filtered = self.items
            self.error = error
            completion()
            
            if !self.items.isEmpty {
                self.localDataManager.removeAll()
                self.localDataManager.saveNewItems()
            }
        }
    }
}
