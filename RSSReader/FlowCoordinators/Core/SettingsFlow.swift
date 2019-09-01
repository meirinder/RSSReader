//
//  SettingsFlow.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class SettingsFlow {
    fileprivate let navigationController: UINavigationController
    private let storyboard = UIStoryboard(name: "Settings", bundle: nil)
    private let realmManager = RealmManager.default
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard let viewController = storyboard.instantiateInitialViewController() as? SettingsViewController else { return }
        let feeds = realmManager.rssFeeds()
        let viewModel = SettingsViewModel(feeds: feeds)
        viewModel.delegate = viewController
        viewController.viewModel = viewModel
        self.navigationController.viewControllers = [viewController]
    }
}


