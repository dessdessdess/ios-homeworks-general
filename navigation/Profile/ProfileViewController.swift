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
        self.view.addSubview(tableView)
        activateConstraints()
        
        dataSource = data
        
        tableView.reloadData()
                
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 220
        }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        headerView.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: headerView.topAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor)
            ])
        return headerView
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
