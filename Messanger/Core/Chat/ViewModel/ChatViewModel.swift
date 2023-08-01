//
//  ChatViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 1.08.2023.
//

import Foundation


final class ChatViewModel: ObservableObject{
    @Published var messageText: String = ""
    @Published var messages = [Message]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages(){
        MessageService.observeMessages(chatPartner: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
}
