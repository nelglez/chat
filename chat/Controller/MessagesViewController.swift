//
//  ViewController.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/27/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Firebase

class MessagesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogOut))
        
        let image = UIImage(named: "plus")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
       checkIfUserIsLoggedIn()
    }
    
     @objc func handleNewMessage(){
        let newMessageVC = NewMessageTableViewController()
        present(UINavigationController(rootViewController: newMessageVC), animated: true, completion: nil)
    }
    
    func checkIfUserIsLoggedIn(){
        //user is not logged in...
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
            
        } else {
            let uid = Auth.auth().currentUser?.uid
            
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                print(snapshot)
                if let dict = snapshot.value as? [String: AnyObject]{
                     self.navigationItem.title = dict["Name"] as? String
                }
               
            }, withCancel: nil)
        }
    }
    
    @objc func handleLogOut(){
        do {
        try Auth.auth().signOut()
        } catch let error {
            print(error.localizedDescription)
            
        }
       let loginVC = LogInViewController()
        present(loginVC, animated: true, completion: nil)
    }

    

}

