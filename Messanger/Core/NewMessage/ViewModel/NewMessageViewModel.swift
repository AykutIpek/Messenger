//
//  NewMessageViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Foundation
import Firebase

@MainActor
final class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init() {
        Task{ try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid })
    }
}
