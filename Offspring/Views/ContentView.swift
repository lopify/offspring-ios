//
//  ContentView.swift
//  Offspring
//
//  Created by Alejandro Lopez on 10/2/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Offspring.name, ascending: true)])
    private var offsprings: FetchedResults<Offspring>
        
    var body: some View {
        NavigationView {
            List {
                ForEach(offsprings) { offspring in
                    Text(offspring.name ?? "Unnamed")
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Offsprings")
            .navigationBarItems(trailing: Button("Add Offspring") {
                addOffspring()
            })
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
    
    private func addOffspring() {
        withAnimation {
            let item = Offspring(context: viewContext)
            item.name = "Paula \(Date())"
            saveContext()
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.forEach { index in
                viewContext.delete(offsprings[index])
            }
            saveContext()
        }
    }
}

