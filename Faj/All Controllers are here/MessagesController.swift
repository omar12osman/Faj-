//
//  MessagesController.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import LBTAComponents
import UIKit

class SearchHeaderitemCell: DatasourceCell {
    
    
    let SearchButton : UIButton = {
        let searchbutton = UIButton()
        searchbutton.layer.cornerRadius = 25
        searchbutton.setImage(UIImage(named:"icons8-search-30"), for: .normal)
        searchbutton.backgroundColor = UIColor(red: 210/255, green: 218/255, blue: 226/255, alpha: 1.0)
        return searchbutton
    }()
    
    override func setupViews() {
        super.setupViews()
    addSubview(SearchButton)
    SearchButton.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 5, rightConstant: 340)
    }
}

class UserHeaderItemCell: DatasourceCell {

    let UserProfile : UIButton = {
    let userprofile = UIButton()
    userprofile.layer.cornerRadius = 25
    userprofile.setImage(UIImage(named:"icons8-user-30"), for: .normal)
    userprofile.backgroundColor = UIColor(red: 210/255, green: 218/255, blue: 226/255, alpha: 1.0)
    return userprofile
    }()
    
    override func setupViews() {
        super.setupViews()
    addSubview(UserProfile)
        
   UserProfile.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 5, leftConstant: 10, bottomConstant: 5, rightConstant: 349)
    
    }
}



class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            NameLabel.text = datasourceItem as? String
        }
    }
    
    let NameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = ""
        nameLabel.textColor = .black
        return nameLabel
        
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
        addSubview(NameLabel)
        NameLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 50, bottomConstant: 0, rightConstant: 0)
    }
}



class MessagesController: DatasourceController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.isTranslucent = false
        
        let Labeltitle = UILabel()
        Labeltitle.text = "Messages"
        Labeltitle.font = UIFont.boldSystemFont(ofSize: 30)
        navigationItem.titleView = Labeltitle
        
      
        
        
        collectionView.backgroundColor = .white
        
        let userMessagesDatasource = UserMessagesDatasource()
        self.datasource = userMessagesDatasource
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 65)
    }
    
}


class  UserMessagesDatasource: Datasource {
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[UserHeaderItemCell.self, SearchHeaderitemCell.self]
    }
   
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self,]
    }
    
    
    let AllUsers = ["Users1","Users2","Users3","Users4"]
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return AllUsers[indexPath.item]
        
    }
    override func numberOfItems(_ section: Int) -> Int {
        return AllUsers.count
        
        
    }
    
    
}
