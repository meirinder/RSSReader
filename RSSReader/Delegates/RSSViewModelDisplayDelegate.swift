//
//  ViewModelDelegate.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

protocol RSSViewModelDisplayDelegate: class {
    func rssViewModelUpdateData(rssViewModel: RSSViewModel)
}
