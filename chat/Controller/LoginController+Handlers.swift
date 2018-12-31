//
//  LoginController+Handlers.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/31/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Firebase

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
    
    @objc func handleRegister(){
        
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let name = nameTextField.text, !name.isEmpty else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            //success!
             guard let uid = Auth.auth().currentUser?.uid else {return}
            let imageName = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
            if let uploadData = self.profileImageView.image, let imageData = uploadData.jpegData(compressionQuality: 0.1){
                storageRef.putData(imageData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                  //  print(metadata)
                    
                    let profileImageUrl = storageRef.downloadURL{ url, error in
                        if let error = error {
                            print(error)
                            return
                        } else {
                            
                                let profileImageUrl = url?.absoluteString
                             let values = ["Name": name, "Email": email, "profileImageUrl": profileImageUrl]
                            self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : Any])
                            
                            }
                    }
                })
            }
           
            
            
            
            
        }
    }
    
    func registerUserIntoDatabaseWithUID(uid: String, values: [String : Any]){
        let ref = Database.database().reference()
       
        let usersRef = ref.child("users").child(uid)
        usersRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            self.dismiss(animated: true, completion: nil)
        })
    }
    
}


    
