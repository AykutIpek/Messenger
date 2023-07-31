//
//  LoginViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import SwiftUI

final class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
