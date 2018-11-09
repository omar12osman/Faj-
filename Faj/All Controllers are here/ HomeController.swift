//
//   HomeController.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource ,  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId, for: indexPath) as! PorfolieCell
        
        return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 440)
    }
    
    
    let CellId = "CellId"
    let AboutCellId = "AboutCellId"
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .red
        return collectionview
    }()
    lazy var UserProfileImageView : UIButton = {
        let userProfileImageView = UIButton()
        userProfileImageView.layer.cornerRadius = 70
        userProfileImageView.clipsToBounds = true
        userProfileImageView.setImage(UIImage(named:"Usericon"), for: .normal)
        //        userProfileImageView.addTarget(self, action: #selector(addUserimageProfile), for: .touchUpInside)
        userProfileImageView.backgroundColor = .white
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        return userProfileImageView
        
    }()
    
    //    @objc func addUserimageProfile(){
    //
    //        let myPickerController = UIImagePickerController()
    //
    //        myPickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate;
    //        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
    //
    //        self.present(myPickerController, animated: true, completion: nil)
    //
    //    }
    
    lazy var UserBackgrundImageProfil : UIImageView = {
        let UserBackgrundImage = UIImageView()
        UserBackgrundImage.contentMode = .scaleAspectFill
        UserBackgrundImage.translatesAutoresizingMaskIntoConstraints = false
        //        UserBackgrundImage.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(UIImagePickerController)))
        UserBackgrundImage.isUserInteractionEnabled = true
        return UserBackgrundImage
    }()
    
    @objc func AddUserBackgrundImage(){
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    //    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    //    {
    //        UserBackgrundImageProfil.image = ([UIImagePickerController.InfoKey.originalImage] as! UIImage)
    //        UserBackgrundImageProfil.backgroundColor = UIColor.clear
    //        UserBackgrundImageProfil.contentMode = UIView.ContentMode.scaleAspectFit
    //        self.dismiss(animated: true, completion: nil)
    //    }
    //
    
    lazy var Hirebutton : UIButton = {
        let Hirebutton = UIButton()
        Hirebutton.layer.cornerRadius = 2
        Hirebutton.clipsToBounds = true
        Hirebutton.setTitleColor(.white, for: .normal)
        Hirebutton.setTitle("HIRE", for: .normal)
        Hirebutton.addTarget(self, action: #selector(HireUserfunc), for: .touchUpInside)
        Hirebutton.backgroundColor = UIColor(red: 30/255, green: 39/255 , blue: 46/255 , alpha: 1.0)
        Hirebutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        Hirebutton.translatesAutoresizingMaskIntoConstraints = false
        return Hirebutton
    }()
    
    @objc func HireUserfunc(){
        
    }
    let UserNameLabel : UILabel = {
        let namelabel = UILabel()
        namelabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        namelabel.text = "Majid Osman"
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.textColor = .black
        return namelabel
    }()
    // Not working yet
    //let Jobtitle : UILabel = {
    //let jobtitle = UILabel()
    //jobtitle.font = UIFont.boldSystemFont(ofSize: 18.0)
    //jobtitle.text = "IOS | Dev"
    //jobtitle.translatesAutoresizingMaskIntoConstraints = false
    //jobtitle.textColor = UIColor.rgb(72, 84, 96)
    //return jobtitle
    //}()
    
    lazy var AboutandPorfolioSegmentedcontroller : UISegmentedControl = {
        let AboutandPorfolioSegment = UISegmentedControl(items: ["Portfolio","About"])
        AboutandPorfolioSegment.tintColor = UIColor(red: 30/255, green: 39/255 , blue: 46/255 , alpha: 1.0)
        AboutandPorfolioSegment.selectedSegmentIndex = 2
        AboutandPorfolioSegment.translatesAutoresizingMaskIntoConstraints = false
        AboutandPorfolioSegment.addTarget(self, action: #selector(AboutandPorfolioSegmentfunc), for: .valueChanged)
        return AboutandPorfolioSegment
    }()
    
    @objc func AboutandPorfolioSegmentfunc(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
        case 1:
            
            break
            
        case 2:
            
            break
            
        default:
            
            break
            
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetAnchors()
        HireUserfunc()
        UserNameLabelfunc()
        //SetupNavigationBarItem()
        view.backgroundColor = UIColor(red: 236/255, green: 240/255 , blue: 241/255 , alpha: 1.0)
        title = ""
        //navigationItem.leftBarButtonItem = UIBarButtonItem(title: titleImageView , style: .plain, target: self, action: #selector(handleLogOut))
        
    }
    private func SetupNavigationBarItem(){
        let titleImageView = UIImageView(image: UIImage(named: "icons8-enter-filled-50"))
        navigationItem.titleView = titleImageView
        
    }
    
    
    
    
    
    @objc func handleLogOut() {
        UserDefaults.standard.setIsLoggedIn(value: false)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    func SetAnchors(){
        //AddUserBackgrundImage()
        // AddUserBackgrundImage()
        
        
        view.addSubview(UserProfileImageView)
        view.addSubview(Hirebutton)
        view.addSubview(AboutandPorfolioSegmentedcontroller)
        view.addSubview(UserBackgrundImageProfil)
        CollectionViewFunc()
        
        UserProfileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        UserProfileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        UserProfileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        UserProfileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        Hirebutton.topAnchor.constraint(equalTo: UserProfileImageView.bottomAnchor, constant: 100).isActive = true
        Hirebutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        Hirebutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        Hirebutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        UserBackgrundImageProfil.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        UserBackgrundImageProfil.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        UserBackgrundImageProfil.bottomAnchor.constraint(equalTo: Hirebutton.topAnchor).isActive = true
        
        
        AboutandPorfolioSegmentedcontroller.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        AboutandPorfolioSegmentedcontroller.topAnchor.constraint(equalTo: Hirebutton.bottomAnchor,constant: 0).isActive = true
        AboutandPorfolioSegmentedcontroller.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        AboutandPorfolioSegmentedcontroller.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func CollectionViewFunc(){
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PorfolieCell.self, forCellWithReuseIdentifier: CellId)
        collectionView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 450, leftConstant: 0, bottomConstant: 10, rightConstant: 0)
        
    }
    func UserNameLabelfunc(){
        view.addSubview(UserNameLabel)
        
        UserNameLabel.anchorWithConstantsToTop(top: UserProfileImageView.bottomAnchor, left: view.leftAnchor, bottom: Hirebutton.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 135, bottomConstant: 30, rightConstant: 0)
        
    }
}
