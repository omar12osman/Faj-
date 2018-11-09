//
//  CustomUITabBarControlle.swift
//  Faj
//
//  Created by Majid Osman on 2018-11-08.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class CustomUITabBarControlle : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homecontroller = HomeController()
        let MainPagehomcontroller = UINavigationController(rootViewController: homecontroller)
        MainPagehomcontroller.tabBarItem.title = "this home controller"
        MainPagehomcontroller.tabBarItem.image = UIImage(named: "icons8-user-30")
        
        
        let flowLayout = UICollectionViewFlowLayout()
        let searchController = SearchController(collectionViewLayout: flowLayout)
        let MainSearchPageController = UINavigationController(rootViewController: searchController)
        MainSearchPageController.tabBarItem.image = UIImage(named: "icons8-search-30")
        
        let messagesController = MessagesController()
        let MainMessagesPageController = UINavigationController(rootViewController: messagesController)
        MainMessagesPageController.tabBarItem.image = UIImage(named: "icons8-chat-30")
        
        
        let controller = AddThingsUserPageController()
        let EditUserPageController = UINavigationController(rootViewController: controller)
        EditUserPageController.tabBarItem.image = UIImage(named: "icons8-plus-math-30")
        
        
        viewControllers = [MainPagehomcontroller , MainSearchPageController , MainMessagesPageController , EditUserPageController]
    }
}

