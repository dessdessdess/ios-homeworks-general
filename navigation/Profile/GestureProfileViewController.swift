//
//  GestureProfileViewController.swift
//  navigation
//
//  Created by Admin on 21.03.2022.
//

import UIKit

class GestureProfileViewController: UIViewController {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cat.jpg"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(crossTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private var avatarTopAnchor: NSLayoutConstraint?
    private var avatarLeadingAnchor: NSLayoutConstraint?
    private var avatarWidthAnchor: NSLayoutConstraint?
    private var avatarHeightAnchor: NSLayoutConstraint?
    private var avatarCenterXAnchor: NSLayoutConstraint?
    private var avatarCenterYAnchor: NSLayoutConstraint?
    
    private var avatarIsOpened = false
    
    private var tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
        self.setupSubviews()
        self.activateConstraints()
    }
    
    private func setupSubviews() {
        self.view.addSubview(backView)
        self.view.addSubview(crossButton)
        self.view.addSubview(avatarImageView)
        self.setupGesture()
    }
    
    private func activateConstraints() {
        self.avatarTopAnchor = self.avatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.avatarLeadingAnchor = self.avatarImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        self.avatarWidthAnchor = self.avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        self.avatarHeightAnchor = self.avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        self.avatarCenterXAnchor = self.avatarImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        self.avatarCenterYAnchor = self.avatarImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor)
        NSLayoutConstraint.activate([
            self.avatarTopAnchor,
            self.avatarLeadingAnchor,
            self.avatarWidthAnchor,
            self.avatarHeightAnchor,
            self.backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.crossButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.crossButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.crossButton.widthAnchor.constraint(equalToConstant: 25),
            self.crossButton.heightAnchor.constraint(equalToConstant: 25),
        ].compactMap({$0}))
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.avatarTapped))
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    @objc private func avatarTapped() {
        
        if !avatarIsOpened {
            self.backView.alpha = 0.5
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarWidthAnchor?.constant = self.view.frame.width
            self.avatarHeightAnchor?.constant = self.view.frame.width
            NSLayoutConstraint.deactivate([
                self.avatarTopAnchor, self.avatarLeadingAnchor,
            ].compactMap({$0}))
            NSLayoutConstraint.activate([
                self.avatarCenterXAnchor, self.avatarCenterYAnchor
            ].compactMap({$0}))
            
            avatarIsOpened.toggle()
            
            UIView.animate(withDuration: 0.5,
                           animations: { self.view.layoutIfNeeded() },
                           completion: {_ in self.changeAlphaCrossButton() })
            
        }
              
    }
    
    private func changeAlphaCrossButton() {
        if avatarIsOpened {
            self.crossButton.alpha = 1
        } else {
            self.crossButton.alpha = 0
        }
        UIView.animate(withDuration: 0.3, animations: { self.view.layoutIfNeeded() })
    }
    
    @objc private func crossTapped() {
        
        avatarIsOpened.toggle()
        
        changeAlphaCrossButton()
        
        self.backView.alpha = 0
        self.avatarImageView.layer.cornerRadius = 50
        self.avatarWidthAnchor?.constant = 100
        self.avatarHeightAnchor?.constant = 100
        NSLayoutConstraint.deactivate([
            self.avatarCenterXAnchor, self.avatarCenterYAnchor,
        ].compactMap({$0}))
        NSLayoutConstraint.activate([
            self.avatarTopAnchor, self.avatarLeadingAnchor
        ].compactMap({$0}))
        
        UIView.animate(withDuration: 0.5, animations: { self.view.layoutIfNeeded() })
        
    }
    
}
