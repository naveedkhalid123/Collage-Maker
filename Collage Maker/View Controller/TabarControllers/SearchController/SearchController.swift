//
//  SearchController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 10/01/2025.
//

import UIKit

class SearchController: UIViewController {
    
    private let name : UILabel = {
        let name = UILabel ()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Search"
        name.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return name
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "theme")
        setUpName()
    }
    private func setUpName(){
        view.addSubview(name)
        NSLayoutConstraint.activate([
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
