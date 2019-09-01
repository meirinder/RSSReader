//
//  Enums.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

enum ParseElements: String {
    case channel = "channel"
    case title = "title"
    case link = "link"
    case pubDate = "pubDate"
    case description = "description"
    case enclosure = "enclosure"
    case item = "item"
    case url = "url"
}

enum ImageNames: String {
    case favouriteImage = "favouriteIcon"
    case unFavouriteImage = "unFavouriteIcon"
    case rssTab = "iconTab0"
    case settings = "conTab1"
}
