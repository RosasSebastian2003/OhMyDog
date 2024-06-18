//
//  Dog.swift
//  OhMyDog
//
//  Created by Sebastian Rosas Maciel on 6/18/24.
//

import Foundation

// Codable makes Structs decodable and encodable into JSON objects, identifiable lets us iterate using the struct's Id attribute
struct Dog: Codable, Identifiable {
    let id: Int
    let breed: String
    let description: String
}
