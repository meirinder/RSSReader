//
//  Post.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

struct Post {
    var title: String
    var link: String
    var date: String
    var description: String
    var enclosure: String
    
    init() {
        self.title = ""
        self.link = ""
        self.date = ""
        self.description = ""
        self.enclosure = ""
    }
}
