//
//  ContentView.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
   
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack (path: $path){
            PeopleView()
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self){
                person in
                EditPersonView(person: person)
            }
            .toolbar {
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
            .searchable(text: $searchText)
        }
    }
    func addPerson() {
        let person = Person(name: "", emailAddress: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
    
   
}

#Preview {
    ContentView()
}
