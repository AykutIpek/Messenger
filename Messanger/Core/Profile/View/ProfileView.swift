//
//  ProfileView.swift
//  Messanger
//
//  Created by aykut ipek on 29.07.2023.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    //MARK: - Propreties
    @StateObject private var viewModel: ProfileViewModel
    private let user: User
    
    
    //MARK: - LifeCycle
    init(user: User, viewModel: ProfileViewModel) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ProfileViewModel())
    }
    
    
    //MARK: - Body
    var body: some View {
        VStack{
            // Header
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    }else{
                        CircularProfileImageView(user: user, size: .xLarge)
                    }
                }
                
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // List
            
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log Out"){
                        
                    }
                    
                    Button("Delete Account"){
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

//MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER, viewModel: ProfileViewModel())
    }
}
