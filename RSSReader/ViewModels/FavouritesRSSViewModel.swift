//
//  FavouritesRSSViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

class FavouritesRSSViewModel: ViewModel {
    private let postsManager = PostsManager.default
    private var posts: [Post]?

    func cellCount() -> Int {
        return posts?.count ?? 0
    }
    
    func viewModelForCell(at index: Int) -> NewsTableViewCellViewModel {
        return NewsTableViewCellViewModel()
    }
    
    
}
