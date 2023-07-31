//
//  ChatView.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var message: String = ""
    var body: some View {
        
        VStack {
            ScrollView{
                // Message
                VStack{
                    CircularProfileImageView(user: User.MOCK_USER, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text("Bruce Wayne")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messanger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                // Chat
                
               
            }
            
            Spacer()
            // Chat input view
            ZStack(alignment: .trailing){
                TextField("Message...", text: $message, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("Send Message")
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
        ChatView()
    }
}