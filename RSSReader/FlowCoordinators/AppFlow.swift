//
//  AppFlow.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class AppFlow {
    
    fileprivate let navigationController: UINavigationController
    fileprivate var coreFlow: CoreFlow
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
        coreFlow = CoreFlow(with: navigationController)
    }
    
    func start() {
        coreFlow.start()
    }
    
    
}
