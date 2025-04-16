//
//  FaceFactsApp.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/15/25.
//

import SwiftUI
import SwiftData

@main
struct FaceFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(for: Person.self)
    }
}

