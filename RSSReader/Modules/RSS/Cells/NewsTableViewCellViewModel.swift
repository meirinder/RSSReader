//
//  NewsTableViewCellViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class NewsTableViewCellViewModel {
   
    private let post: Post
    private let imageManager = ImageManager.default
    
    init(post: Post) {
        self.post = post
    }
    
    func title() -> String {
        return post.title
    }
    
    func description() -> String {
        return post.description
    }
    
    func image(completion: @escaping (UIImage) -> ()) {
        imageManager.loadImage(from: post.enclosure, completion: completion) 
    }
}
