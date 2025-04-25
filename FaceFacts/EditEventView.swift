//
//  EditEventView.swift
//  FaceFacts
//
//  Created by Charles Michael on 4/25/25.
//

import SwiftUI
import SwiftData

struct EditEventView: View {
    @Bindable var event: Event
    
    var body: some View {
        Form {
            
            TextField("name of event", text: $event.name)
                .textContentType(.name)
            TextField("Location", text: $event.location)
        }
        .navigationTitle("Edit Event")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditEventView()
//}
