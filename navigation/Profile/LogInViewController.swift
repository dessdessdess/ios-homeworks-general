//
//  LogInViewController.swift
//  navigation
//
//  Created by Admin on 12.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var logInHeaderView: LogInHeaderView = {
        let logInHeaderView = LogInHeaderView()
        return logInHeaderView
    }()
    
    private lazy var scrollView: UIScrollView = {
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
    
    private lazy var loginButton: UIButton = {
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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.activateConstraints()
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
        
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewRightConstraint = self.contentView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor)
        let contentViewLeftConstraint = self.contentView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor)
        let contentViewCenterYConstraint = self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let contentViewCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
                
        let loginHeaderViewLeadingAnchor = self.logInHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let loginHeaderViewTrailingAnchor = self.logInHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let loginHeaderViewTopAnchor = self.logInHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor)
        let loginHeaderViewHeightAnchor = self.logInHeaderView.heightAnchor.constraint(equalToConstant: 440)
        
        let loginButtonTopAnchor = self.loginButton.topAnchor.constraint(equalTo: self.logInHeaderView.bottomAnchor, constant: 16)
        let loginButtonLeftAnchor = self.loginButton.leftAnchor.constraint(equalTo: self.logInHeaderView.leftAnchor, constant: 16)
        let loginButtonTrailingAnchor = self.loginButton.trailingAnchor.constraint(equalTo: self.logInHeaderView.trailingAnchor, constant: -16)
        let loginButtonHeightAnchor = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint,
            contentViewTopConstraint, contentViewBottomConstraint, contentViewRightConstraint, contentViewLeftConstraint,            contentViewCenterYConstraint, contentViewCenterXConstraint,
            loginHeaderViewLeadingAnchor, loginHeaderViewTrailingAnchor, loginHeaderViewTopAnchor, loginHeaderViewHeightAnchor,
            loginButtonTopAnchor, loginButtonLeftAnchor, loginButtonTrailingAnchor, loginButtonHeightAnchor
        ])
        
        self.logInHeaderView.activateConstraints()
    }
        
    @objc private func didTapLoginButton() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc private func kbdShow(notification: NSNotification){
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentInset.bottom = kbdSize.height
            self.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentInset.bottom = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    
}
