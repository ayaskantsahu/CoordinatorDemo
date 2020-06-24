//
//  LandingViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol LandingViewControllerDelegate: class {
    func onSigninTapped()
    func onSignupTapped()
}

class LandingViewController: UIViewController {

    weak var coordinator: LandingViewControllerDelegate?
    
    var signinButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(onSigninTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var signupButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(onSignupTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Landing Page"
        view.addSubview(signinButton)
        view.addSubview(signupButton)
        
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
    }
    
    init(coordinator: LandingViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onSigninTapped(sender: UIButton!) {
        coordinator?.onSigninTapped()
    }
    
    @objc func onSignupTapped(sender: UIButton!) {
        coordinator?.onSignupTapped()
    }
    
}
