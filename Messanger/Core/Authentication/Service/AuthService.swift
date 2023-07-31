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


final class AuthService: IAuthService{
    
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Email is \(email)")
        print("DEBUG: Password is \(password)")
    }
    
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Create user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
}
