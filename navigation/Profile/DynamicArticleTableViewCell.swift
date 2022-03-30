//
//  DynamicArticleTableViewCell.swift
//  navigation
//
//  Created by Admin on 13.03.2022.
//

import UIKit

final class DynamicArticleTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
    }
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.descriptionLabel.text = nil
        self.newsImageView = UIImageView()
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.authorLabel)
        self.stackView.addArrangedSubview(self.newsImageView)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.horizontalStackView.addArrangedSubview(self.likesLabel)
        self.horizontalStackView.addArrangedSubview(self.viewsLabel)
        self.stackView.addArrangedSubview(self.horizontalStackView)
        self.activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            self.newsImageView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width),
            
            self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            
            self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
            self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 0),
            self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: 0),
            self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)
        ])
    }
}

extension DynamicArticleTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.authorLabel.text = viewModel.author
        self.descriptionLabel.text = viewModel.description
        self.newsImageView.image = UIImage(named: viewModel.image)
        self.likesLabel.text = "Likes: \(viewModel.likes)"
        self.viewsLabel.text = "Views: \(viewModel.views)"
    }
}
