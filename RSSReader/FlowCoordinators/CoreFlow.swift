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
    fileprivate var normalFlow: NormalFlow
    fileprivate var favouritesFlow: FavouritesFlow
    fileprivate var tabBarController: UITabBarController
    
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        tabBarController = UITabBarController()
        normalNavigationController = UINavigationController()
        normalNavigationController.title = "Normal"
        favouritesNavigationController = UINavigationController()
        favouritesNavigationController.title = "Favourites"
        normalFlow = NormalFlow(with: normalNavigationController)
        favouritesFlow = FavouritesFlow(with: favouritesNavigationController)
    }
    
    func start() {
        tabBarController.viewControllers = [normalNavigationController, favouritesNavigationController]
        self.navigationController.viewControllers = [tabBarController]
        normalFlow.start()
        favouritesFlow.start()
    }
}
