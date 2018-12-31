//
//  LoginController+Handlers.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/31/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit

extension LogInViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

@objc func handleSelectProfileImageView(){
    let picker = UIImagePickerController()
  
    picker.delegate = self
    picker.allowsEditing = true
    present(picker, animated: true, completion: nil)
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    

    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


    
