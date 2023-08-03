//
//  Constanst.swift
//  Messanger
//
//  Created by aykut ipek on 1.08.2023.
//

import Foundation
import Firebase


struct FirestoreConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messageCollection = Firestore.firestore().collection("messages")
}
