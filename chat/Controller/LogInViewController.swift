//
//  LogInViewController.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/27/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let inputContainerView = UIView()
    inputContainerView.backgroundColor = .white
    //need below for it to actually show up on the screen
    inputContainerView.translatesAutoresizingMaskIntoConstraints = false

    override func viewDidLoad() {
        super.viewDidLoad()

      //  view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
       
        view.addSubview(inputContainerView)
        
        //now add contraints: need x, y, width, and height
        //x value to be centered on the entire view
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //y value centered too
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true //-24 means 12 pixels on the left and 12 pixels on the right
        
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
