//
//  SearchViewController.swift
//  CoordinatorDemo
//
//  Created by Ayas Sahu on 6/25/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate: class {
    func onSearchTapped()
}

class SearchViewController: UIViewController {
    
    weak var coordinator: SearchViewControllerDelegate?
    
    var dummyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .systemBackground
        label.text = "Nothing to see here!!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        navigationItem.title = "Search Page"
        view.addSubview(dummyLabel)
        
        dummyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dummyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    init(coordinator: SearchViewControllerDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
