//
//  AppDelegate.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppFlow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = UINavigationController()
        appCoordinator = AppFlow(with: window?.rootViewController as! UINavigationController)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()!
        (window?.rootViewController as! UINavigationController).viewControllers = [vc]
        appCoordinator?.start()
        window?.makeKeyAndVisible()

        return true
    }
    
}

