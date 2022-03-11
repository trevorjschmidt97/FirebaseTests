//
//  FirebaseFirestoreService.swift
//  FirebaseTests
//
//  Created by Trevor Schmidt on 3/10/22.
//

import Foundation
import FirebaseFirestore

struct FirebaseFirestoreService {
    private init() { }
    
    static let shared = FirebaseFirestoreService()
    
    let rootRef = Firestore.firestore()
    
    struct Keys {
        
    }
    
    enum FirestoreError: LocalizedError {
        case unWrappingSnapshot
    }
    
    func storeSomething(merkleTree: MerkleTree, completion: @escaping (Result<Void,Error>) -> Void) {
        
        rootRef.collection("Test").document("merkleTree").setData(merkleTree) { error in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(()))
        }
    }
    
    func retrieveMerkleTree(completion: @escaping (Result<MerkleTree,Error>) -> Void) {
        rootRef.collection("Test").document("merkleTree").getDocument { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let snapshot = snapshot, let data = snapshot.data() else {
                completion(.failure(FirestoreError.unWrappingSnapshot))
                return
            }
            
            completion(.success(data))
        }
    }
    
}
