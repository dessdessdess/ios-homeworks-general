//
//  ProfileHeaderView.swift
//  navigation
//
//  Created by Admin on 13.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView = UIImageView(image: UIImage(named: "cat.jpg"))
    private let nameLabel = UILabel()
    private let statusButton = UIButton()
    private let statusLabel = UILabel()
    private var statusText = "Waiting for something..."
    private let textField = UITextField()
    private var textFieldHeightAnchor: NSLayoutConstraint?
    private var textFieldIsHidden = true
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupSubViews() {
        
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.cornerRadius = 50
        self.addSubview(avatarImageView)
                
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.textColor = .black
        nameLabel.text = "Hipster Cat"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.text = statusText
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusLabel)
                
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.addSubview(textField)
        
        statusButton.clipsToBounds = true
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitle("Изменить статус", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.addTarget(self, action: #selector(didTapStatusButton), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false                
        statusButton.layer.cornerRadius = 12.0;
        statusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        statusButton.layer.shadowRadius = 4.0
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.masksToBounds = false
        self.addSubview(statusButton)
        
    }
    
    func activateConstraints() {
        
        let safeArea = self.superview!.safeAreaLayoutGuide
        
        self.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        avatarImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                        
        nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 27).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 34).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
       
        textField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16).isActive = true
        textFieldHeightAnchor = textField.heightAnchor.constraint(equalToConstant: 0)
        textFieldHeightAnchor?.isActive = true
        
        statusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16).isActive = true
        statusButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        statusButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        guard let _statusText = textField.text else { return }
        statusText = _statusText
    }
    
    @objc private func didTapStatusButton() {
                        
        textFieldHeightAnchor?.constant = textFieldIsHidden ? 40 : 0
                
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.textFieldIsHidden.toggle()
            self.statusLabel.text = self.statusText            
            if self.textFieldIsHidden {
                self.statusButton.setTitle("Изменить статус", for: .normal)
            } else {
                self.statusButton.setTitle("Сохранить статус", for: .normal)
            }
        }
        
    }
        
}
