//
//  ViewController.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/27/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //user is not logged in...
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
         
        }
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogOut))
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

