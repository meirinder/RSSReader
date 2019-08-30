//
//  NormalFlow.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class NormalFlow {
    fileprivate let navigationController: UINavigationController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let viewController = storyboard.instantiateInitialViewController() as? RSSViewController else { return }
        viewController.viewModel = NormalRSSViewModel()
        self.navigationController.viewControllers = [viewController]
    }
}
