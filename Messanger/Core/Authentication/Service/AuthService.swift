//
//  AuthService.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Foundation
import Firebase


protocol IAuthService {
    func login(withEmail email: String, password: String) async throws
    func createUser(withEmail email: String, password: String, fullName: String) async throws
}


final class AuthService{
    
    //MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    //MARK: - LifeCycle
    init() {
        self.userSession = Auth.auth().currentUser
    }
}

//MARK: - Functions
extension AuthService: IAuthService{
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // Signs out is backend
            self.userSession = nil // update routing logic
        } catch {
            print("DEBUG: Sign out error: \(error.localizedDescription)")
        }
    }
    
}
