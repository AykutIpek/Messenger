//
//  InboxViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import Foundation
import Combine


final class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
}


//MARK: - Functions
extension InboxViewModel{
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
