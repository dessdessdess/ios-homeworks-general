//
//  FeedViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.backButtonTitle = "Назад"
        self.view.addSubview(self.goToPostButton)
        self.activateConstraints()                                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    struct Post {
        var title: String
    }
    
    private lazy var goToPostButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            button.backgroundColor = .systemBlue
            button.setTitle("Посмотреть пост", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapGoToPostButton), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
 
    @objc private func didTapGoToPostButton() {
        let postViewController = PostViewController()
        postViewController.postDetail = Post(title: "Первый пост")
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func activateConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.goToPostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.goToPostButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
        self.goToPostButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        self.goToPostButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true        
    }
    
}
