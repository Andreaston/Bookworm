//
//  BookwormApp.swift
//  Bookworm
//
//  Created by André on 29/10/2026.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)

    }
}
