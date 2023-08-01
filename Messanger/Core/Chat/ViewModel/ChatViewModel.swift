//
//  ChatViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 1.08.2023.
//

import Foundation


final class ChatViewModel: ObservableObject{
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages(){
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        service.sendMessage(messageText)
    }
}
