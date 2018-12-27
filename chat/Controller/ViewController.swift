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
        
//        let ref = Database.database().reference(fromURL: "https://chat-app-e1db0.firebaseio.com/")
//        ref.updateChildValues(["someValue": 123234])
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(handleLogOut))
    }
    
    @objc func handleLogOut(){
       let loginVC = LogInViewController()
        present(loginVC, animated: true, completion: nil)
    }

    

}

