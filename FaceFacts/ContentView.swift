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
    
    @State private var sortOrder = [SortDescriptor(\Person.name)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack (path: $path){
            PeopleView(searchString: searchText)
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self){
                person in
                EditPersonView(person: person)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Name [A-Z]")
                            .tag([SortDescriptor(\Person.name)])
                        Text("Name [Z-A]")
                            .tag([SortDescriptor(\Person.name, order: .reverse)])
                    }
                }
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
