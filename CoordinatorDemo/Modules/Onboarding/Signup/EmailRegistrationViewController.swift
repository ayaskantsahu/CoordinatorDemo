//
//  EmailRegistrationViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

// MARK: - Delegate

protocol EmailRegistrationViewControllerDelegate: class {
    func goBack()
    func onRegister()
}

class EmailRegistrationViewController: UIViewController {
    
    weak var coordinator: EmailRegistrationViewControllerDelegate?
    
    var registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Register and send code to email", for: .normal)
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Registration Page"
        view.addSubview(registerButton)
        
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: EmailRegistrationViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onRegister(sender: UIButton!) {
        coordinator?.onRegister()
    }
    
}
