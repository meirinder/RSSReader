//
//  NewsTableViewCell.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView? 
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionTextView: UITextView?
    
    static let identifier = "NewsTableViewCell"
    weak var viewModel: NewsTableViewCellViewModel? {
        didSet {
            setCell()
        }
    }
    
    private func setCell() {
        
    }

}
