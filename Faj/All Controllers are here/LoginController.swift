//
//  LoginController.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

protocol LoginControllerDelegate: class {
    func finishedLogIn()
}

class LoginController: UIViewController, LoginControllerDelegate {
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    
    // constraint variables used for animation
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonBottomAnchor: NSLayoutConstraint?
    var nextButtonBottomAnchor: NSLayoutConstraint?
    
    let pages: [Page] = {
        let firstPage = Page(title: "freelancing app ", message: "FAJ Gives You The Power To Find The Right Person to Hire Fast & Easy, Or finding Freelancing job .Fast Delivery Offers. Hands on Support.", imageName: "Page1")
        
        
        let secondPage = Page(title: "Here are we the world leading app", message: "You can spend hours of precious time searching for documents", imageName: "Page2")
        
        
        
        let thirdPage = Page(title: "Join us today  ", message: "and become your own boss Sign up with Freja eid or bankid", imageName: "Page3")
        
        return [firstPage, secondPage, thirdPage]
    }()
    //    rgba(178, 190, 195,1.0) rgba(236, 240, 241,1.0)
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 236/255, green: 240/255 , blue: 241/255 , alpha: 1.0)
        
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.numberOfPages = self.pages.count + 1
        pc.currentPageIndicatorTintColor = UIColor.rgb(45, 52, 54)
        return pc
    }()
    
    lazy var skipButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(UIColor.rgb(45, 52, 54), for: .normal)
        btn.addTarget(self, action: #selector(skipPages), for: .touchUpInside)
        return btn
    }()
    
    lazy var nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(UIColor.rgb(45, 52, 54), for: .normal)
        btn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 60/266, green: 90/255, blue: 151/255, alpha: 1)
        
        // observe Key board Notifications / anchors
        observeKeyboardNotifications()
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        skipButtonBottomAnchor = skipButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 16, rightConstant: 0, widthConstant: 60, heightConstant: 50)[2]
        
        nextButtonBottomAnchor = nextButton.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightConstant: 10, widthConstant: 60, heightConstant: 50)[2]
        
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        registerCells()
        
        pageControlBottomAnchor = pageControl.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)[1]
    }
    
    
    @objc func skipPages() {
        let indexPath = IndexPath(item: pages.count, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = pages.count
        animatePage()
    }
    
    
    @objc func nextPage() {
        if pageControl.currentPage == pages.count { return }
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
        
        // take care of the last page animation
        animatePage()
    }
    
    
    func animatePage() {
        if pageControl.currentPage == pages.count {
            moveConstraintsOffScreen()
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
    }
    
    
    fileprivate func moveConstraintsOffScreen() {
        pageControlBottomAnchor?.constant = 50
        skipButtonBottomAnchor?.constant = 0
        nextButtonBottomAnchor?.constant = 0
    }
    
    
    fileprivate func moveConstraintsOnScreen() {
        pageControlBottomAnchor?.constant = 0
        skipButtonBottomAnchor?.constant = 50
        nextButtonBottomAnchor?.constant = 50
    }
    
    
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            let y: CGFloat = UIDevice.current.orientation.isLandscape ? -110 : -70
            self.view.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        // if we are on the last page of the Onboarding
        if pageNumber == pages.count {
            moveConstraintsOffScreen()
        } else {
            moveConstraintsOnScreen()
        }
        
        // animate layout if needed
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    fileprivate func registerCells() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    
    func finishedLogIn() {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        guard let mainNavigationController = rootViewController as? MainNavigationController else { return }
        
        mainNavigationController.viewControllers = [HomeController()]
        
        UserDefaults.standard.setIsLoggedIn(value: true)
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
