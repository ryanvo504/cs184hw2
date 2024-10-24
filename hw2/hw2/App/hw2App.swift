//
//  hw2App.swift
//  hw2
//
//  Created by Ryan Vo on 10/23/24.
//

import SwiftUI
import Firebase

@main
struct hw2App: App {
    @StateObject var viewModel = AuthviewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
