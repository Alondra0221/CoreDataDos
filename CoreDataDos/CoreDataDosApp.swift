//
//  CoreDataDosApp.swift
//  CoreDataDos
//
//  Created by Alondra García Morales on 05/12/23.
//

import SwiftUI

@main
struct CoreDataDosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
