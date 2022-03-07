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
        self.view.addSubview(stackView)
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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(goToPostButton)
        stackView.addArrangedSubview(secondGoToPostButton)
        return stackView
    }()
    
    private lazy var goToPostButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            button.backgroundColor = .systemBlue
            button.setTitle("Посмотреть пост #1", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(didTapGoToPostButton), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    private lazy var secondGoToPostButton: UIButton = {
            let button = UIButton()
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            button.backgroundColor = .systemBlue
            button.setTitle("Посмотреть пост #2", for: .normal)
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
        NSLayoutConstraint.activate([
            self.stackView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.goToPostButton.heightAnchor.constraint(equalToConstant: 50),
            self.secondGoToPostButton.heightAnchor.constraint(equalTo: self.goToPostButton.heightAnchor)
        ])
    }
    
}
