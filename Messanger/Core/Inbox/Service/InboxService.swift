//
//  InboxService.swift
//  Messanger
//
//  Created by aykut ipek on 3.08.2023.
//

import Foundation
import Firebase


final class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeRecentMessages(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreConstants.messageCollection.document(uid).collection("recent-messages").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified }) else { return }
            self.documentChanges = changes
        }
    }
}
