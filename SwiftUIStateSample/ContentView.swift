//
//	ContentView.swift
//  SwiftUIStateSample
//
//  Created by Juan Mueller on 12/21/22.
//  For more, visit www.ajourneyforwisdom.com
//

import SwiftUI

struct ContentView: View {
    @State private var message = "Write a message"
    
    var body: some View {
        VStack {
            MessageFormView(message: $message)
        }.padding()
    }
}

struct MessageFormView: View {
    // The message to be sent
    @Binding var message: String
    @State private var showingAlert = false

    var body: some View {
        VStack {
            // A text field bound to the message state
            TextField("Enter message", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // A button that sends the message when tapped
            Button("Show Alert") {
                showingAlert = true
            }
            .alert(message,
                   isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
