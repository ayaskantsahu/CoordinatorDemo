//
//  TutorialViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/23/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol TutorialViewControllerDelegate: class {
    func onTutorialDone()
}

class TutorialViewController: UIViewController {

    weak var coordinator: TutorialViewControllerDelegate?
    
    var homeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Go home", for: .normal)
        button.addTarget(self, action: #selector(onHomeTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Tutorial Page"
        view.addSubview(homeButton)
        
        homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: TutorialViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onHomeTapped(sender: UIButton!) {
        coordinator?.onTutorialDone()
    }

}
