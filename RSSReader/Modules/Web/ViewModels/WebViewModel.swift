//
//  WebViewModel.swift
//  RSSReader
//
//  Created by Savely on 02/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

class WebViewModel {
    
    private let link: String
    
    init(link: String) {
        self.link = link
    }
    
    func url() -> URL? { 
        return URL(string: link)
    }
}
