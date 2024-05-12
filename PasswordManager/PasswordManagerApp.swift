//
//  PasswordManagerApp.swift
//  PasswordManager
//
//  Created by ryota.nozu on 2024/05/12.
//

import SwiftUI

@main
struct PasswordManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
