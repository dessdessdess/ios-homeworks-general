//
//  TabBarController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let colorSet = UIColor(hexString: "4885CC")
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.tabBar.tintColor = colorSet
        
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper"), tag: 0)
                
        let logInViewController = LogInViewController()
        logInViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        
        let gestureProfileViewController = GestureProfileViewController()
        gestureProfileViewController.tabBarItem = UITabBarItem(title: "Avatar", image: UIImage(systemName: "person.crop.circle"), tag: 2)
                
        self.setViewControllers(
            [
                UINavigationController(rootViewController: feedViewController),
                UINavigationController(rootViewController: logInViewController),
                UINavigationController(rootViewController: gestureProfileViewController)
            ]
            , animated: true)
        
    }

}
