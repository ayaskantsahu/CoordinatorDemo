//
//  ViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol RedViewControllerDelegate: class {
    func navigateToGreen()
}

class RedViewController: UIViewController {
    
    var coordinator: RedViewControllerDelegate
    
    var greenButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemTeal
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Naviage to green", for: .normal)
        return button
    }()
    
    init(coordinator: RedViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        view.addSubview(greenButton)
        greenButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        greenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        greenButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    @objc func buttonTapped(sender : UIButton) {
        coordinator.navigateToGreen()
    }
}

