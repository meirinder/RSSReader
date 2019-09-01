//
//  FavouritesRSSViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

class FavouritesRSSViewModel: DefaultRSSViewModel {
     
    override func updateNews() {
        let tmpFeeds = realmManager.rssFeeds()
        feeds?.removeAll()
        feeds = [Feed]()
        posts.removeAll()
        for feed in tmpFeeds {
            if let url = URL(string: feed.value) {
                if feed.isFavourite {
                    feeds?.append(feed)
                    let feedResult = postsManager.postsFrom(url: url)
                    posts[feed.value] = feedResult.posts
                    feedTitles.append(feedResult.title)
                }
            }
        }
        displayDelegate?.rssViewModelUpdateData(rssViewModel: self)
    }
 
}
