//
//  ChatMessageCell.swift
//  Messanger
//
//  Created by aykut ipek on 31.07.2023.
//

import SwiftUI

struct ChatMessageCell: View {
    var isFromCurrentUser: Bool
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                
//                MessageBallon(backgroundColor: ,
//                              foregroundColor: .white,
//                              frameMaxWidth: 1.5,
//                              alignment: .trailing)
                Text("This is a text message for now. What happens in the seen view same body")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }else{
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("This is a text message for now. What happens in the seen view same body")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(isFromCurrentUser: false)
    }
}
