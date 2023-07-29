//
//  User.swift
//  Messanger
//
//  Created by aykut ipek on 29.07.2023.
//

import Foundation


struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
}

extension User{
    static let MOCK_USER = User(fullName: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "Astronout")
}
