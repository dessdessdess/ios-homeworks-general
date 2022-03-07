//
//  PostViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postDetail: FeedViewController.Post? //в ДЗ написано: "cоздайте объект типа Post в FeedViewController и передайте его в PostViewController". Поэтому в PostViewController сделано свойство postDetail c типом FeedViewController.Post? Если есть более оптимальный способ передачи структуры между контроллерами - прошу подсказать
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        self.setupTitle()
        self.setupBarButtonItem()
    }
    
    private func setupTitle() {
        guard let _postDetail = postDetail else { return }
        navigationItem.title = _postDetail.title
    }
    
    private func setupBarButtonItem() {
        let newItem = UIBarButtonItem.init(image: UIImage(systemName: "square.and.pencil"), style: .done, target: self, action: #selector(self.didTapEditButton))
        self.navigationItem.setRightBarButton(newItem, animated: true)
    }
    
    @objc private func didTapEditButton() {
        present(InfoViewController(), animated: true, completion: nil)
    }
       
}
