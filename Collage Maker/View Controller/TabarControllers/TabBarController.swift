//
//  TabBarControllerViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 10/01/2025.
//

import UIKit

class TabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func setUpTabBars(){
        let home = self.createNavs(with: "Home", and: UIImage(systemName: "Home"), vc: HomeControllerViewController)
        self.setViewControllers([], animated: true)
    }
    
    private func createNavs(with title: String, and image: UIImage? , vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title + "Controller"
        return nav
    }
}
