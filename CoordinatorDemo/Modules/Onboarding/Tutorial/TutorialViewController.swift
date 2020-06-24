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
    
    var finishLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .systemBackground
        label.text = "Thank you for finishing coordinator demo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Tutorial Page"
        view.addSubview(finishLabel)
        
        finishLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        finishLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: TutorialViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
