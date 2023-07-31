//
//  UserService.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol IUserService {
    func fetchCurrentUser() async throws
}





final class UserService{
    //MARK: - Properties
    static let shared = UserService()
    @Published var currentUser: User?

}

//MARK: - Functions
extension UserService: IUserService{
    
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: Current user in service is \(currentUser)")
    }
    
}
