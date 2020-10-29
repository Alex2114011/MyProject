//
//  AppDelegate.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let vc = ItemListViewController()
            let navigation = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
            return true
        }



}

