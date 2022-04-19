//
//  MainTabBarConroller.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import UIKit

class MainTabBarConroller: UITabBarController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.setupViewController()
    }
    
    
    private func setupViewController() {
        viewControllers = [
            tabBarVC(for: usersList(), title: "Users", icon: "person.2.fill"),
            tabBarVC(for: animalsList(), title: "Animals", icon: "eye")
        ]
    }
    
    
    private func tabBarVC(for vc: UIViewController, title: String, icon: String) -> UIViewController {
        
        vc.navigationItem.largeTitleDisplayMode = .always
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = UIImage(
            systemName: icon,
            withConfiguration: UIImage.SymbolConfiguration(scale: .large)
        )
        vc.title = title
        nav.navigationBar.prefersLargeTitles = true
        return nav
    }
    
    
    private func usersList() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }
    
    
    private func animalsList() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        return vc
    }
}
