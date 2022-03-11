//
//  FirebaseTestsApp.swift
//  FirebaseTests
//
//  Created by Trevor Schmidt on 3/10/22.
//

import SwiftUI
import Firebase

@main
struct FirebaseTestsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
