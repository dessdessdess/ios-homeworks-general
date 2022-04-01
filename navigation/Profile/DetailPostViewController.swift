//
//  DetailPostViewController.swift
//  navigation
//
//  Created by Admin on 01.04.2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    var indexPathRow = 0
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupSubviews()
        self.activateConstraints()
    }
    
    private func setupSubviews() {
        self.newsImageView.image = UIImage(named: data[indexPathRow].image)
        self.view.addSubview(newsImageView)
        self.descriptionLabel.text = data[indexPathRow].description
        self.view.addSubview(descriptionLabel)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            self.newsImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.newsImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.newsImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.newsImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-32),
            
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.newsImageView.leadingAnchor),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.newsImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.newsImageView.trailingAnchor),
            //self.descriptionLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = data[indexPathRow].author
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = ""
    }
    
}
