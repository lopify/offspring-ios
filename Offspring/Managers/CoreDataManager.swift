//
//  DataManager.swift
//  Offspring
//
//  Created by Alejandro Lopez on 10/2/21.
//

import CoreData
import Foundation

//struct CoreDataManager {
//    static let shared = CoreDataManager()
//
//    let container: NSPersistentContainer
//
//    init() {
//        container = NSPersistentContainer(name: "Model")
//
//        container.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error: \(error)")
//            }
//        }
//    }
//}


struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentCloudKitContainer(name: "Model")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
}
