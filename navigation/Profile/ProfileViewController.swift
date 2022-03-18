//
//  ProfileViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
        
    private var dataSource: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        self.view.backgroundColor = .white
        self.navigationItem.title = "Профиль"
        self.navigationItem.backButtonTitle = "Back"
        self.view.addSubview(tableView)
        activateConstraints()
        
        dataSource = data
        
        tableView.reloadData()
                
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
    
    private lazy var photosTableViewSection: PhotosTableViewSection = {
        let photosTableViewSection = PhotosTableViewSection()
        photosTableViewSection.arrowButton.addTarget(self, action: #selector(didTapArrowButton), for: .touchUpInside)
        return photosTableViewSection
    }()
    
    //для открытия collection view, нажатие на секцию не работает
    @objc private func didTapArrowButton() {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(DynamicArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
       }()

        
    private func activateConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
                        
        self.profileHeaderView.activateConstraints()
        
    }
     
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        } else {
            return self.dataSource.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return 236
        }
        else {
            
            //как правильно расчитать высоту секции если высота избражений расчитывается от ширины экрана?
            //при повороте экрана надо же перерасчитывать высоту
            return 150
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        //чтобы скрыть футер секции
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //чтобы скрыть футер секции
        let someView = UIView()
        return someView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            let headerView = UIView(frame: .zero)
            headerView.addSubview(profileHeaderView)
            
            NSLayoutConstraint.activate([
                self.profileHeaderView.topAnchor.constraint(equalTo: headerView.topAnchor),
                self.profileHeaderView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                self.profileHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
                self.profileHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor)
            ])
            return headerView
            
        } else {
            
            //по заданию сказано что надо сделать для секции
            let someView = UIView(frame: .zero)
            someView.addSubview(photosTableViewSection)
            
            NSLayoutConstraint.activate([
                self.photosTableViewSection.topAnchor.constraint(equalTo: someView.topAnchor),
                self.photosTableViewSection.bottomAnchor.constraint(equalTo: someView.bottomAnchor),
                self.photosTableViewSection.leadingAnchor.constraint(equalTo: someView.safeAreaLayoutGuide.leadingAnchor),
                self.photosTableViewSection.trailingAnchor.constraint(equalTo: someView.safeAreaLayoutGuide.trailingAnchor)
            ])
            
            for subView in photosTableViewSection.stackView.arrangedSubviews {
                //расчет высоты картинок
                subView.heightAnchor.constraint(lessThanOrEqualToConstant: (self.view.frame.width/4) - 24).isActive = true
            }
            
            return someView
                    
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath) //не отрабатывает при нажатии на секцию, поэтому пришлось открытие фото галереи  сделать по нажатию стрелки вправо
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? DynamicArticleTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let article = self.dataSource[indexPath.row]
        let viewModel = DynamicArticleTableViewCell.ViewModel(author: article.author,
                                                              description: article.description,
                                                              image: article.image,
                                                              likes: article.likes,
                                                              views: article.views)
        cell.setup(with: viewModel)
        return cell
    }
}
