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
    static func fetchAllUsers() async throws -> [User]
}





final class UserService{
    //MARK: - Properties
    static let shared = UserService()
    @Published var currentUser: User?

}

//MARK: - Functions
extension UserService: IUserService{
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User)-> Void){
        FirestoreConstants.userCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else {return}
            completion(user)
        }
    }
    
}
