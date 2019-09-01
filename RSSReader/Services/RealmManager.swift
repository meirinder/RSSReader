//
//  RealmManager.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let `default` = RealmManager()
    
    private let realm = try! Realm()
    
    func rssFeeds() -> [Feed] {
        var feeds = [Feed]()
        do {
            try realm.write {
                if let listFeeds = realm.objects(FeedWrapper.self).first?.feeds {
                    for feed in listFeeds {
                        feeds.append(feed)
                    }
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
        return feeds
    }
    
    func deleteFeed(at index: Int) {
        do {
            try realm.write {
                if let listFeeds = realm.objects(FeedWrapper.self).first?.feeds {
                    listFeeds.remove(at: index)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateFavouriteState(at index: Int, state: Bool) {
        do {
            try realm.write {
                if let listFeeds = realm.objects(FeedWrapper.self).first?.feeds {
                    listFeeds[index].isFavourite = state
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func saveNewFeed(value: String, isFavourite: Bool) {
        let feed = Feed()
        feed.value = value
        feed.isFavourite = isFavourite
        do {
            try realm.write {
                if let feeds = realm.objects(FeedWrapper.self).first?.feeds {
                    feeds.append(feed)
                } else {
                    let feedWrapper = FeedWrapper()
                    feedWrapper.feeds.append(feed)
                    realm.add(feedWrapper)
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
