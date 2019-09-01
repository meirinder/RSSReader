//
//  Feeds.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation
import RealmSwift

class FeedWrapper: Object {
    let feeds = List<Feed>()
}

class Feed: Object {
    @objc dynamic var value: String = ""
    @objc dynamic var isFavourite: Bool = false
}
