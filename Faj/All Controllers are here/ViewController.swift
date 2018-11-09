//
//  ViewController.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

struct Docu {
    let id : Int
    let Name : String
    let Link : String
    let ImageUrl : String
    
}




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // let myDouc = Docu(id: 1, Name: "docu", Link: "som link", ImageUrl: "pic")
        
        let jsonUrlString = "https://www.letsbuildthatapp.com/course/instagram-firebase"
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = String(data: data!, encoding: .utf8) else {return}
            
            print(data)
            
            
            
            }.resume()
    }
    
    
}
