//
//  User.swift
//  Messanger
//
//  Created by aykut ipek on 29.07.2023.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String{
        return uid ?? NSUUID().uuidString
    }
}

extension User{
    static let MOCK_USER = User(fullName: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "Astronout")
}
