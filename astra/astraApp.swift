//
//  astraApp.swift
//  astra
//
//  Created by Ayşegül Yurtdakal on 17.02.2023.
//

import SwiftUI

@main
struct astraApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
