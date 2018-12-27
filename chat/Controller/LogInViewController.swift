//
//  LogInViewController.swift
//  chat
//
//  Created by Nelson Gonzalez on 12/27/18.
//  Copyright © 2018 Nelson Gonzalez. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        //need below for it to actually show up on the screen
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        //if we dont do below cornerRadius will not work.
        view.mask?.clipsToBounds = true
        return view
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let nameSeparatorView: UIView = {
       let separatorView = UIView()
        separatorView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let emailSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        return separatorView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

      //  view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
      
        view.addSubview(inputContainerView)
        view.addSubview(loginRegisterButton)
        setupInputContainerView()
        setupLoginRegisterButton()
        
    }
    
    func setupInputContainerView() {
        //now add contraints: need x, y, width, and height
        //x value to be centered on the entire view
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //y value centered too
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true //-24 means 12 pixels on the left and 12 pixels on the right
        
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(nameSeparatorView)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(emailSeparatorView)
        inputContainerView.addSubview(passwordTextField)
        //need x, y, width, and height
        //specify where the nametextfield needs to be
        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        //top of the view
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        //width
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //height
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true // 1/3 of the entire height
        
        
        //need x, y, width, and height
        
        nameSeparatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //need x, y, width, and height
        //specify where the nametextfield needs to be
        emailTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        //top of the view
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        //width
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //height
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true // 1/3 of the entire height
        
        
        //need x, y, width, and height
        
        emailSeparatorView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //need x, y, width, and height
        //specify where the nametextfield needs to be
        passwordTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        //top of the view
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        //width
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        //height
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true // 1/3 of the entire height
    }
    
    func setupLoginRegisterButton(){
        //need x, y, width, and height
        //x at center of view
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //y value at bottom of inputContainerView
        loginRegisterButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 12).isActive = true
        //set as wide as inputContainerView
        loginRegisterButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
