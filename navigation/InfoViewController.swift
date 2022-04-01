//
//  InfoViewController.swift
//  navigation
//
//  Created by Admin on 11.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.saveButton)
        self.activateConstraints()
    }
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func activateConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.saveButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
        self.saveButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        self.saveButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc private func didTapSaveButton() {
        let alert = UIAlertController(title: "Внимание",
                                      message: "Сохранить изменения?",
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "ОК",
                                      style: UIAlertAction.Style.default,
                                      handler: saveChanges))
        alert.addAction(UIAlertAction(title: "Отмена",
                                      style: UIAlertAction.Style.default,
                                      handler: dismissChanges))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func saveChanges(action: UIAlertAction) {
        print(#function)
    }
    
    private func dismissChanges(action: UIAlertAction) {
        print(#function)
    }
    
}
