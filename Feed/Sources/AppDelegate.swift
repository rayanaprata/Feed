//
//  AppDelegate.swift
//  Feed
//
//  Created by Rayana Prata Neves on 30/09/21.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UITabBar.appearance().tintColor = UIColor(red: 249/255, green: 202/255, blue: 3/255, alpha: 1)

        FirebaseApp.configure()
        
        //let viewController = SignInViewController()
        //let navigationController = UINavigationController(rootViewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = navigationController
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

