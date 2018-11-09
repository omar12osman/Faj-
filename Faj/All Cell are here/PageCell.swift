//
//  PageCell.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet {
            
            guard let page = page else {
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let fontColor = UIColor.rgb(28, 42, 57)
            let fotColortow = UIColor.rgb(99, 110, 114)
            
            let attributedText = NSMutableAttributedString(string: page.title,
                                                           attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.bold),
                                                                                                                         convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): fontColor]))
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: convertToOptionalNSAttributedStringKeyDictionary([convertFromNSAttributedStringKey(NSAttributedString.Key.font): UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium), convertFromNSAttributedStringKey(NSAttributedString.Key.foregroundColor): fotColortow])))
            
            // Center Text in TextView
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let stringLength = attributedText.string.characters.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: stringLength))
            
            textView.attributedText = attributedText
            
        }
    }
    //    rgba(236, 240, 241 ,1.0)
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = UIColor(red: 236/255, green: 240/255 , blue: 241/255 , alpha: 1.0)
        iv.image = UIImage(named: "Page1")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 30
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    //     rgba(236, 240, 241 ,1.0)
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Walkthrough"
        tv.textColor = .white
        tv.isEditable = false
        tv.backgroundColor = UIColor(red: 236/255, green: 240/255 , blue: 241/255 , alpha: 1.0)
        
        
        // Give it some space from the top
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        
        return tv
    }()
    
    let logoImageView : UIImageView = {
        let logoImageview = UIImageView()
        logoImageview.image = UIImage(named: "logo")
        logoImageview.translatesAutoresizingMaskIntoConstraints = false
        logoImageview.contentMode = .scaleAspectFill
        return logoImageview
    }()
    
    //    lazy var BankidButton : UIButton = {
    //        let bankidbtn = UIButton(type: .system)
    //        bankidbtn.setTitle("Log in with bankid", for: .normal)
    //        bankidbtn.setTitleColor(UIColor.rgb(45, 52, 54), for: .normal)
    //        bankidbtn.translatesAutoresizingMaskIntoConstraints = false
    //        bankidbtn.addTarget(self, action: #selector(HandelgoingtoBankid), for: .touchUpInside)
    //        return bankidbtn
    //    }()
    //
    //    @objc func HandelgoingtoBankid(){
    //        print(1234)
    //
    //    }
    
    
    
    
    let lineSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        //      HandelgoingtoBankid()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        addSubview(imageView)
        addSubview(lineSeperatorView)
        addSubview(textView)
        addSubview(logoImageView)
        // addSubview(BankidButton)
        //
        //        BankidButton.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        //        BankidButton.widthAnchor.constraint(equalToConstant: 231).isActive = true
        //        BankidButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        //        BankidButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 200).isActive = true
        //
        //        self Anchored logoImageView
        
        
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        //         self Anchored imageView
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        
        lineSeperatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeperatorView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -180, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
    return input.rawValue
}

