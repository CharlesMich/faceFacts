//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/15/25.
//
import SwiftData
import SwiftUI

struct EditPersonView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var navigationPath: NavigationPath
    @Bindable var person: Person
    @Query(sort: [SortDescriptor(\Event.name),
                  SortDescriptor(\Event.location)
                 ]) var events: [Event]
    var body: some View {
        Form {
            Section {
                TextField("name", text: $person.name)
                    .textContentType(.name)
                TextField("EMail Address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            Section("Where did you meet them"){
                Picker("Met at", selection: $person.metAt){
                    Text("Unknown event")
                        .tag(Optional<Event>.none)
                    
                    if events.isEmpty == false {
                        Divider()
                        
                        ForEach(events) { event in
                            Text(event.name)
                                .tag(Optional(event))
                        }
                    }
                }
                Button("Add a new Event", action: addEvent)
            }
            Section("Notes"){
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: Event.self){ event in
            EditEventView(event: event)
        }
    }
    
    func addEvent(){
        let event = Event(name: "", location: "")
        modelContext.insert(event)
        navigationPath.append(event)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return EditPersonView(person: previewer.person, navigationPath: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    } catch {
       return  Text("sdfsjdhf \(error.localizedDescription)")
    }
}
