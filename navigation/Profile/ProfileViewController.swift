//
//  ProfileViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        self.view.addSubview(profileHeaderView)
        profileHeaderView.activateConstraints()
    }
           
}
