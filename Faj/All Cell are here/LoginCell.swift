//
//  LoginCell.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "email"
        textField.keyboardType = .emailAddress
        return textField
    }()
    //    rgba(61, 61, 61,1.0)
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.layer.cornerRadius = 20
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        //        change the color to black
        button.backgroundColor = UIColor.rgb(61, 61, 61)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log in", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var GmailiCon : UIButton = {
        let gmailIcon = UIButton()
        gmailIcon.layer.cornerRadius = 0.5 * gmailIcon.bounds.size.width
        gmailIcon.clipsToBounds = true
        gmailIcon.setImage(UIImage(named:"Group 6"), for: .normal)
        gmailIcon.addTarget(self, action: #selector(gmailIconsfunc), for: .touchUpInside)
        gmailIcon.translatesAutoresizingMaskIntoConstraints = false
        return gmailIcon
        
    }()
    
    
    @objc func gmailIconsfunc(){
        print(11111)
    }
    
    
    
    
    lazy var FacebookiCon : UIButton = {
        let facebookIcon = UIButton()
        facebookIcon.layer.cornerRadius = 0.5 * facebookIcon.bounds.size.width
        facebookIcon.clipsToBounds = true
        facebookIcon.setImage(UIImage(named:"Group 4"), for: .normal)
        facebookIcon.addTarget(self, action: #selector(facebookIconfunc), for: .touchUpInside)
        facebookIcon.translatesAutoresizingMaskIntoConstraints = false
        return facebookIcon
        
    }()
    
    @objc func facebookIconfunc(){
        print(5678)
    }
    
    
    
    lazy var TwitteriCon : UIButton = {
        let twitterIcon = UIButton()
        twitterIcon.layer.cornerRadius = 0.5 * twitterIcon.bounds.size.width
        twitterIcon.clipsToBounds = true
        twitterIcon.setImage(UIImage(named:"Group 5"), for: .normal)
        twitterIcon.addTarget(self, action: #selector(twitterIconfunc), for: .touchUpInside)
        twitterIcon.translatesAutoresizingMaskIntoConstraints = false
        return twitterIcon
        
    }()
    
    @objc func twitterIconfunc(){
        print(9012)
    }
    
    
    
    
    
    
    
    
    
    
    
    weak var delegate: LoginControllerDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        gmailIconsfunc()
        facebookIconfunc()
        twitterIconfunc()
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(GmailiCon)
        addSubview(FacebookiCon)
        addSubview(TwitteriCon)
        _ = logoImageView.anchor(top: centerYAnchor, left: nil, bottom: nil, right: nil, topConstant: -200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 160)
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(top: logoImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(top: emailTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 15, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
        _ = loginButton.anchor(top: passwordTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 15, leftConstant: 30, bottomConstant: 0, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
        GmailiCon.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 30).isActive = true
        GmailiCon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        GmailiCon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        GmailiCon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
        
        FacebookiCon.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 30).isActive = true
        FacebookiCon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        FacebookiCon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        FacebookiCon.leadingAnchor.constraint(equalTo: GmailiCon.leadingAnchor, constant: 90).isActive = true
        
        TwitteriCon.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 30).isActive = true
        TwitteriCon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        TwitteriCon.heightAnchor.constraint(equalToConstant: 100).isActive = true
        TwitteriCon.leadingAnchor.constraint(equalTo: FacebookiCon.leadingAnchor, constant: 90).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func handleLogin() {
        // Log in stuff
        // then call completion
        delegate?.finishedLogIn()
    }
    
}


// Subclass UITextField to add some left padding

class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
}
