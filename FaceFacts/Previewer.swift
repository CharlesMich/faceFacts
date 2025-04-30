//
//  Previewer.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/30/25.
//

import Foundation
import SwiftData


@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Dimension", location: "nottikdjfs")
        person = Person(name: "dhfsd", emailAddress: "dfhskd", details: "ksdjfshdkj", metAt: event)
        
        container.mainContext.insert(person)
    }
}
