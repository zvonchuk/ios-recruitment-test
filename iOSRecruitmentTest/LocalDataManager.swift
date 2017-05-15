//
//  LocalDataManager.swift
//  iOSRecruitmentTest
//
//  Created by user on 5/15/17.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import CoreData

class LocalDataManager {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchItems(completion: @escaping ItemsFetchComletion) {
        context.perform {
            do {
                let fetchRequest = NSFetchRequest<Item>(entityName: String(describing: Item.self))
                fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
                let items = try self.context.fetch(fetchRequest)
                completion(items, nil)
            } catch(let error) {
                completion(nil, error)
            }
        }
    }
    
    func saveNewItems() {
        do {
            try context.save()
        } catch {
            print("Could not save items")
        }
    }
    
    func removeAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Item.self))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.persistentStoreCoordinator?.execute(deleteRequest, with: context)
        } catch {
            print("Could not remove all items")
        }
    }
}
