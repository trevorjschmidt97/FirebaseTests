//
//  MerkleTree.swift
//  FirebaseTests
//
//  Created by Trevor Schmidt on 3/10/22.
//

import Foundation

typealias MerkleTree = [String:Any]

extension MerkleTree {
    func toString() {
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(self) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
}
