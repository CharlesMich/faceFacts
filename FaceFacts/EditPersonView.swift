//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/15/25.
//

import SwiftUI

struct EditPersonView: View {
    @Bindable var person: Person
    var body: some View {
        Form {
            Section {
                TextField("name", text: $person.name)
                    .textContentType(.name)
                TextField("EMail Address", text: $person.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            Section("Notes"){
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
            .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditPersonView()
//}
