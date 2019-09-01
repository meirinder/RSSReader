//
//  DefaultRSSViewModel.swift
//  RSSReader
//
//  Created by Savely on 02/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class DefaultRSSViewModel: RSSViewModel {
    weak var displayDelegate: RSSViewModelDisplayDelegate?
    weak var actionDelegate: RSSViewModelActionDelegate?
    
    let realmManager = RealmManager.default
    let postsManager = PostsManager.default
    var posts = [String: [Post]]()
    var feeds: [Feed]?
    var feedTitles = [String]()
    
    func updateNews() {
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
    
    
    func sectionTitles(at section: Int) -> String? {
        return feedTitles[section]
    }
    
    func selectRow(at section: Int, index: Int) {
        guard let feeds = feeds, let localPosts = posts[feeds[section].value] else { return }
        let link = localPosts[index].link
        actionDelegate?.rssViewModel(rssViewModel: self, showWeb: link)
    }
    
    func sectionCount() -> Int {
        return posts.count
    }
    
    func cellCount(at section: Int) -> Int {
        guard let feeds = feeds, let sectionPosts = posts[feeds[section].value] else { return 0 }
        return sectionPosts.count
    }
    
    func viewModelForCell(section: Int, index: Int) -> NewsTableViewCellViewModel? {
        guard let feeds = feeds, let sectionPosts = posts[feeds[section].value] else { return nil }
        return NewsTableViewCellViewModel(post: sectionPosts[index])
    }
}
