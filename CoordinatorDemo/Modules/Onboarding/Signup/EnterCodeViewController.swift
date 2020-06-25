//
//  EnterCodeViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol EnterCodeViewControllerDelegate: class {
    func goBack()
    func onVerify()
}

class EnterCodeViewController: UIViewController {
    
    weak var coordinator: EnterCodeViewControllerDelegate?
    
    var codeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Enter code from email", for: .normal)
        button.addTarget(self, action: #selector(onVerify), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Code verification"
        view.addSubview(codeButton)
        
        codeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        codeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: EnterCodeViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (self.isMovingFromParent || self.isBeingDismissed) {
            coordinator?.goBack()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onVerify(sender: UIButton!) {
        coordinator?.onVerify()
    }
}
