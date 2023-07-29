//
//  ProfileViewModel.swift
//  Messanger
//
//  Created by aykut ipek on 29.07.2023.
//

import SwiftUI
import PhotosUI


final class ProfileViewModel: ObservableObject{
    //MARK: - Properties
    @Published var selectedItem: PhotosPickerItem?{
        didSet{
            Task{
                try await loadImage()
            }
        }
    }
    @Published var profileImage: Image?
    //MARK: - LifeCycle
    

}

//MARK: - Functions
extension ProfileViewModel{
    func loadImage() async throws{
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
