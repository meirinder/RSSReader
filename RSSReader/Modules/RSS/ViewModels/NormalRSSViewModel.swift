//
//  NormalRSSViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

class NormalRSSViewModel: DefaultRSSViewModel {

    override func updateNews() {
        feeds = realmManager.rssFeeds()
        posts.removeAll()
        guard let feeds = feeds else { return }
        for feed in feeds {
            if let url = URL(string: feed.value) {
                let feedResult = postsManager.postsFrom(url: url)
                posts[feed.value] = feedResult.posts
                feedTitles.append(feedResult.title)
            }
        }
        displayDelegate?.rssViewModelUpdateData(rssViewModel: self)
    } 
    
}
