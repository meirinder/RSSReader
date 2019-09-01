//
//  SettingsVIewModel.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class SettingsViewModel {
    weak var delegate: SettingsViewModelDelegate?
    private let realmManager = RealmManager.default
    
    private var feeds: [Feed]
    
    init(feeds: [Feed]) {
        self.feeds = feeds
    }
    
    func addNewFeed(value: String) {
        let feed = Feed()
        feed.value = value
        feed.isFavourite = false
        feeds.append(feed)
        delegate?.settingsViewModelUpdateFeeds(settingsViewModel: self)
        realmManager.saveNewFeed(value: value, isFavourite: false)
    }
    
    func cellCount() -> Int {
        return feeds.count + 1
    }
    
    func checkFeedLink(string: String)  {
        let errorText = "Check that the link is correct"
        if let url = URL(string: string) {
            if PostsManager.default.checkRSS(url: url) {
                addNewFeed(value: string)
                return
            } else {
                delegate?.settingsViewModel(settingsViewModel: self, show: errorText)
            }
        }
        delegate?.settingsViewModel(settingsViewModel: self, show: errorText)
    }
    
    func deleteFeed(at index: Int) {
        realmManager.deleteFeed(at: index) 
        feeds.remove(at: index)
    }
    
    func updateState(at index: Int) {
        realmManager.updateFavouriteState(at: index, state: !feeds[index].isFavourite) 
        delegate?.settingsViewModelUpdateFeeds(settingsViewModel: self)
    }
    
    func cellNameAndImage(at index: Int) -> (name: String, image: UIImage?) {
        if index == feeds.count {
            return ("Add new feed", nil)
        }
        let image = feeds[index].isFavourite ? UIImage(named:ImageNames.favouriteImage.rawValue ) : UIImage(named:ImageNames.unFavouriteImage.rawValue)
        return (feeds[index].value, image)
    }
}
