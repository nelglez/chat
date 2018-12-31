//
//  NewMessageTableViewController.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/31/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit
import Firebase

class NewMessageTableViewController: UITableViewController {
    
    let cellId = "cellId"
    var users = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handelCancel))
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        fetchUser()
    }
    
    func fetchUser(){
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: AnyObject] {
            let name = dict["Name"] as? String
            let email = dict["Email"] as? String
           let user = Users()
                user.name = name
                user.email = email
               self.users.append(user)
                
                //This will crash because of background thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    @objc func handelCancel(){
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

       
        let user = users[indexPath.row]
         cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        // Configure the cell...

        return cell
    }
  

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class UserCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("Error!")
        
    }
}
