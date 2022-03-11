//
//  ContentView.swift
//  FirebaseTests
//
//  Created by Trevor Schmidt on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(viewModel.response)")
            Button("Retrieve Merkle Tree") {
                viewModel.retrieveMerkleTree()
            }
            Spacer()
        }
            .padding()
            .onAppear {
                viewModel.onAppear()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
