//
//  OffspringApp.swift
//  Offspring
//
//  Created by Alejandro Lopez on 10/2/21.
//

import SwiftUI

@main
struct OffspringApp: App {
    
    let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
