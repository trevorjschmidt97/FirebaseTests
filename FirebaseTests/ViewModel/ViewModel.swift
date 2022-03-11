//
//  ViewModel.swift
//  FirebaseTests
//
//  Created by Trevor Schmidt on 3/10/22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var response = "loading..."
    
    
    func onAppear() {
        
        let merkleTree: MerkleTree = [
            "abcd": [
                "ab": [
                    "a", "b"
                ],
                "cd": [
                    "c", "d"
                ]
            ]
        ]
        
        
        FirebaseFirestoreService.shared.storeSomething(merkleTree: merkleTree) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.response = "Success Saving Merkle Tree"
                case .failure(let error):
                    self?.response = error.localizedDescription
                }
            }
        }
    }
    
    func retrieveMerkleTree() {
        FirebaseFirestoreService.shared.retrieveMerkleTree { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let merkleTree):
                    self?.response = merkleTree
                case .failure(let error):
                    self?.response = error.localizedDescription
                }
            }
        }
    }
}
