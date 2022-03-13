//
//  TabBarController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
        
//        let profileViewController = ProfileViewController()
//        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        
        let logInViewController = LogInViewController()
        logInViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        
        self.setViewControllers(
            [
                UINavigationController(rootViewController: feedViewController),
                UINavigationController(rootViewController: logInViewController)
            ]
            , animated: true)
        
    }

}
