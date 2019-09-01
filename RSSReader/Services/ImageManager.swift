//
//  ImageManager.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class ImageManager {
    static let `default` = ImageManager() 
    
    func loadImage(from link: String, completion: @escaping(UIImage) -> ()) {
        guard let url = URL(string: link) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else { return }
            if let image = UIImage(data: data) {
                 completion(image)
            }
        }).resume()
    }
}
