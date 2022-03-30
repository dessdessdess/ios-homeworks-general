//
//  LogInViewController.swift
//  navigation
//
//  Created by Admin on 12.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logInHeaderView: LogInHeaderView = {
        let logInHeaderView = LogInHeaderView()
        return logInHeaderView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(self.logInHeaderView)
        contentView.addSubview(self.loginButton)
        return contentView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel.png")?.image(alpha: 0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel.png")?.image(alpha: 0.8), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel.png")?.image(alpha: 0.8), for: .disabled)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.activateConstraints()
        self.setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    private func activateConstraints() {
     
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            self.contentView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor),
            self.contentView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            self.logInHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.logInHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.logInHeaderView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.logInHeaderView.heightAnchor.constraint(equalToConstant: 100),
            
            self.loginButton.topAnchor.constraint(equalTo: self.logInHeaderView.bottomAnchor, constant: 16),
            self.loginButton.leftAnchor.constraint(equalTo: self.logInHeaderView.leftAnchor, constant: 16),
            self.loginButton.trailingAnchor.constraint(equalTo: self.logInHeaderView.trailingAnchor, constant: -16),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.logInHeaderView.activateConstraints()
    }
    
    private func setupGesture() {
            self.tapGestureRecognizer.addTarget(self, action: #selector(self.viewTapped))
            self.view.addGestureRecognizer(self.tapGestureRecognizer)
        }
    
    @objc private func viewTapped() {
        self.view.endEditing(true)
    }
        
    @objc private func didTapLoginButton() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc private func kbdShow(notification: NSNotification){
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentOffset.y = self.loginButton.frame.height + 16
            self.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentOffset.y = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
       
}
