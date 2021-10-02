//
//  TabBarViewController.swift
//  Feed
//
//  Created by Claudio Noberto  on 02/10/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createFeedViewController(),
            createPostViewController(),
            createProfileViewController()
        ]
       
        selectedIndex = 0
    }
    
    private func createFeedViewController() -> UIViewController {
        let viewController = FeedViewController()
        let navBar = UINavigationController(rootViewController: viewController)
        viewController.title = "Feed"
        viewController.tabBarItem.title = "Feed"
        viewController.tabBarItem.image = UIImage(named: "ico-feed")
        navBar.navigationBar.barTintColor = UIColor(red: 249/255, green: 202/255, blue: 3/255, alpha: 1)
        return navBar
    }
    
    private func createPostViewController() -> UIViewController {
        let viewController = PostViewController()
        let navBar = UINavigationController(rootViewController: viewController)
        viewController.title = "Criar postagem"
        viewController.tabBarItem.title = "Postar"
        viewController.tabBarItem.image = UIImage(named: "ico-new-post")
        navBar.navigationBar.barTintColor = UIColor(red: 249/255, green: 202/255, blue: 3/255, alpha: 1)
        return navBar
    }
    
    private func createProfileViewController() -> UIViewController {
        let viewController = ProfileViewController()
        let navBar = UINavigationController(rootViewController: viewController)
        viewController.title = "Perfil"
        viewController.tabBarItem.title = "Perfil"
        viewController.tabBarItem.image = UIImage(named: "ico-profile")
        navBar.navigationBar.barTintColor = UIColor(red: 249/255, green: 202/255, blue: 3/255, alpha: 1)
        return navBar
    }
    
}
