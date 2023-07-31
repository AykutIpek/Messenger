//
//  ContentViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Firebase
import Combine

final class ContentViewModel: ObservableObject{
    @Published var userSession: Firebase.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
}

extension ContentViewModel{
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}
