//
//  PhotosTableViewSection.swift
//  navigation
//
//  Created by Admin on 17.03.2022.
//

import UIKit

class PhotosTableViewSection: UIView {
    
    private lazy var photosLabel:UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.textColor = .black
        photosLabel.font = .boldSystemFont(ofSize: 24)
        photosLabel.text = "Photos"
        return photosLabel
    }()
    
    lazy var arrowButton:UIButton = {
        guard let arrowImage = UIImage(systemName: "arrow.right") else {return UIButton()}
        let arrowImageView = UIButton()
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.setImage(arrowImage, for: .normal)
        arrowImageView.tintColor = .black
        return arrowImageView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        for i in (1...4) {
            guard let image = UIImage(named: "images-\(i)") else {return stackView}
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            stackView.addArrangedSubview(imageView)
        }
        return stackView
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
        
        self.addSubview(self.photosLabel)
        self.addSubview(self.arrowButton)
        self.addSubview(self.stackView)
        self.activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            
            self.photosLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            self.photosLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
   
            self.arrowButton.centerYAnchor.constraint(equalTo: self.photosLabel.centerYAnchor),
            self.arrowButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            self.stackView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
           
        ])
                
    }
    
}
