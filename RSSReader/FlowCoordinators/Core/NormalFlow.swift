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
        let viewModel = NormalRSSViewModel()
        viewModel.displayDelegate = viewController
        viewModel.actionDelegate = self
        viewController.viewModel = viewModel
        self.navigationController.viewControllers = [viewController]
    }
}

extension NormalFlow: RSSViewModelActionDelegate {
    func rssViewModel(rssViewModel: RSSViewModel, showWeb withLink: String) {
        let webStoryboard = UIStoryboard(name: "Web", bundle: nil)
        guard let viewController = webStoryboard.instantiateInitialViewController() as? WebViewController else { return }
        let viewModel = WebViewModel(link: withLink)
        viewController.viewModel = viewModel
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
