//
//  ChatView.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        
        VStack {
            ScrollView{
                // Message
                VStack{
                    CircularProfileImageView(user: user, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text(user.fullName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                // Chat
                
                ForEach(viewModel.messages) { message in
                    ChatMessageCell(message: message)
           
                }
            }
            
            Spacer()
            // Chat input view
            ZStack(alignment: .trailing){
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)

            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.MOCK_USER)
    }
}
