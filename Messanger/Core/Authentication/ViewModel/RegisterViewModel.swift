//
//  RegisterViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Foundation


final class RegisterViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
