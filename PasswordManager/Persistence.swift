//
//  Persistence.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/05/12.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "PasswordManager")
        
        container.loadPersistentStores(completionHandler: { (StoreDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
