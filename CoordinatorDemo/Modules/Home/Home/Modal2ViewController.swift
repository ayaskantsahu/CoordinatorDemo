//
//  Modal2ViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/29/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol Modal2ViewControllerDelegate: class {
    func onDismissed()
}

class Modal2ViewController: UIViewController {
    
    weak var coordinator: Modal2ViewControllerDelegate?
    
    var dummyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .systemBackground
        label.text = "This a an example modal presentation"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Modal 2"
        view.addSubview(dummyLabel)
        
        dummyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dummyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: Modal2ViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (self.isMovingFromParent || self.isBeingDismissed) {
            coordinator?.onDismissed()
        }
    }
}
