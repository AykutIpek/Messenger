//
//  NewMessageView.swift
//  Messanger
//
//  Created by aykut ipek on 29.07.2023.
//

import SwiftUI

struct NewMessageView: View {
    //MARK: - Properties
    @State private var searchText: String = ""
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView{
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                    .padding(.horizontal, 12)
                Text("CONTACTS")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(0 ... 10, id: \.self) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            Text("Chadwick Bozeman")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
        }
        }
    }
}

//MARK: - Previews
struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView()
        }
    }
}
