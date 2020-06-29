//
//  DashboardViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/25/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func onModal1Tapped()
    func onModal2Tapped()
}

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeViewControllerDelegate?
    
    var modal1Button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Modal 1", for: .normal)
        button.addTarget(self, action: #selector(onModal1Tapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modal2Button: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Modal 2", for: .normal)
        button.addTarget(self, action: #selector(onModal2Tapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(coordinator: HomeViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Home Page"
        view.addSubview(modal1Button)
        view.addSubview(modal2Button)
        
        modal1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modal1Button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
        modal2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modal2Button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true
    }
    
    @objc func onModal1Tapped(sender: UIButton!) {
        coordinator?.onModal1Tapped()
    }
    
    @objc func onModal2Tapped(sender: UIButton!) {
        coordinator?.onModal2Tapped()
    }

}
