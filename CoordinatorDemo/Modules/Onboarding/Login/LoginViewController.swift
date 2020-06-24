//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func onLoginTapped()
}

class LoginViewController: UIViewController {
    
    weak var coordinator: LoginViewControllerDelegate?
    
    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("login and move on", for: .normal)
        button.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Sign-In Page"
        view.addSubview(loginButton)
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    init(coordinator: LoginViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onLoginTapped(sender: UIButton!) {
        coordinator?.onLoginTapped()
    }
}
