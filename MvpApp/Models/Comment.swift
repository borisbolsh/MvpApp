//
//  Person.swift
//  MvpApp
//
//  Created by Boris Bolshakov on 26.12.21.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
