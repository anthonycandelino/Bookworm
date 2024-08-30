//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Anthony Candelino on 2024-08-26.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
