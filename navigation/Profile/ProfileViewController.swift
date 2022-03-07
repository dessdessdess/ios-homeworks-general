//
//  ProfileViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"            
        self.view.addSubview(profileHeaderView)
        self.view.addSubview(self.someButton)
        activateConstraints()
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
    
    private lazy var someButton: UIButton = {
        let someButton = UIButton()
        someButton.backgroundColor = .systemRed
        someButton.setTitle("Красная кнопка", for: .normal)
        someButton.setTitleColor(.white, for: .normal)
        someButton.addTarget(self, action: #selector(didTapSomeButton), for: .touchUpInside)
        someButton.translatesAutoresizingMaskIntoConstraints = false
        return someButton
    }()
    
    @objc private func didTapSomeButton() {
        print(#function)
    }
    
    private func activateConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            self.someButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.someButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.someButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.someButton.heightAnchor.constraint(equalToConstant: 20)
        ])
                        
        self.profileHeaderView.activateConstraints()
    }
           
}
