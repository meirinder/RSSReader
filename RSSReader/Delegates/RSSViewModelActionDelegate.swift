//
//  RSSViewModelActionDelegate.swift
//  RSSReader
//
//  Created by Savely on 02/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

protocol RSSViewModelActionDelegate: class {
    func rssViewModel(rssViewModel: RSSViewModel, showWeb withLink: String)
}
