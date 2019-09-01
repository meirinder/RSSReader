//
//  NewsTableViewCell.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var newsImageView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionTextLabel: UILabel?
    
    static let identifier = "NewsTableViewCell"
    weak var viewModel: NewsTableViewCellViewModel? {
        didSet {
            setCell()
        }
    }
    
    private func setCell() {
        guard  let viewModel = viewModel else { return }
        titleLabel?.text = viewModel.title() 
        descriptionTextLabel?.isHidden = viewModel.description().trimmingCharacters(in: .whitespacesAndNewlines).count == 0
        descriptionTextLabel?.text = viewModel.description() 
        viewModel.image { (image) in
            DispatchQueue.main.async {
                self.newsImageView?.image = image
            }
        }
        
    }

}
