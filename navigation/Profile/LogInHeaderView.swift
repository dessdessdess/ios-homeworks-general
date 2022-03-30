//
//  LogInHeaderView.swift
//  navigation
//
//  Created by Admin on 12.03.2022.
//

import UIKit

class LogInHeaderView: UIView{
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(passwordTextField)
        return stackView
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Email or phone"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner
        ]
        textField.clipsToBounds = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [
            .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        textField.clipsToBounds = true
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5))
        textField.leftViewMode = .always
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(self.logoImageView)
        self.addSubview(self.stackView)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            self.logoImageView.bottomAnchor.constraint(equalTo: self.stackView.centerYAnchor, constant: -120),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.stackView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    
}


