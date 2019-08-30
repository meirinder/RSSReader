//
//  FavouritesFlow.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class FavouritesFlow {
    fileprivate let navigationController: UINavigationController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController 
    }
    
    func start() {
        guard let viewController = storyboard.instantiateInitialViewController() as? RSSViewController else { return }
        viewController.viewModel = FavouritesRSSViewModel()
        self.navigationController.viewControllers = [viewController]
    }
}
