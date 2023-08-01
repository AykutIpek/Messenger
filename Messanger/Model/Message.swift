//
//  Message.swift
//  Messanger
//
//  Created by aykut ipek on 1.08.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timeStamp: Timestamp
    
    var user: User?
    
    var id: String{
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
}
