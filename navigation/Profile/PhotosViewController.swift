//
//  PhotosViewController.swift
//  navigation
//
//  Created by Admin on 17.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let crossButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "x.circle"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(crossTapped), for: .touchUpInside)
        return button
    }()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.backView)
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.crossButton)
        self.activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 8),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.crossButton.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -5),
            self.crossButton.bottomAnchor.constraint(equalTo: self.imageView.topAnchor, constant: -5),
            self.crossButton.widthAnchor.constraint(equalToConstant: 30),
            self.crossButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        // 3 элемента в ряду
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc private func imageTapped(sender: CustomTapGestureRecognizer) {
        guard let indexPath = sender.indexPath else { return }
        self.imageView.image = UIImage(named: "images-\(indexPath.row+1)")
        self.imageView.isHidden = false
        self.backView.alpha = 0.6
        self.crossButton.alpha = 1
   }
    
    @objc private func crossTapped(sender: CustomTapGestureRecognizer) {
        self.imageView.isHidden = true
        self.imageView.image = nil
        self.backView.alpha = 0
        self.crossButton.alpha = 0
   }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            cell.backgroundColor = .systemRed
            return cell
        }
        
        cell.setup(with: indexPath.row+1)
        
        cell.imageView.isUserInteractionEnabled = true
        let imageTapGestureRecognizer = CustomTapGestureRecognizer(target:self, action: #selector(self.imageTapped))
        imageTapGestureRecognizer.indexPath = indexPath
        cell.imageView.addGestureRecognizer(imageTapGestureRecognizer)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
}
