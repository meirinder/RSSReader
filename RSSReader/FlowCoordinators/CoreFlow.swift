//
//  CoreFlow.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class CoreFlow {
    
    fileprivate let navigationController: UINavigationController
    
    fileprivate let normalNavigationController: UINavigationController
    fileprivate let favouritesNavigationController: UINavigationController
    fileprivate let settingsNavigationController: UINavigationController
    
    fileprivate var normalFlow: NormalFlow
    fileprivate var favouritesFlow: FavouritesFlow
    fileprivate var settingsFlow: SettingsFlow
    
    fileprivate var tabBarController: UITabBarController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        tabBarController = UITabBarController()
        normalNavigationController = UINavigationController()
        normalNavigationController.title = "Normal"
        normalNavigationController.tabBarItem = UITabBarItem(title: "RSS", image: UIImage(named: ImageNames.rssTab.rawValue), tag: 0)
        favouritesNavigationController = UINavigationController()
        favouritesNavigationController.title = "Favourites"
        favouritesNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        settingsNavigationController = UINavigationController()
        settingsNavigationController.title = "Settings"
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: ImageNames.settings.rawValue), tag: 2)
        normalFlow = NormalFlow(with: normalNavigationController)
        favouritesFlow = FavouritesFlow(with: favouritesNavigationController)
        settingsFlow = SettingsFlow(with: settingsNavigationController)
    }
    
    func start() {
        tabBarController.viewControllers = [normalNavigationController, favouritesNavigationController, settingsNavigationController]
        self.navigationController.viewControllers = [tabBarController]
        normalFlow.start()
        favouritesFlow.start()
        settingsFlow.start()
    }
}
