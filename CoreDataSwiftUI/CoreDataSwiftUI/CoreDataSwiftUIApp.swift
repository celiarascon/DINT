//
//  CoreDataSwiftUIApp.swift
//  CoreDataSwiftUI
//
//  Created by Celia Rascón García on 28/2/25.
//

import SwiftUI

@main
struct CoreDataSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
