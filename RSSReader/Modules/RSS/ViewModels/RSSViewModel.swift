//
//  ViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

protocol RSSViewModel: class {
    var displayDelegate: RSSViewModelDisplayDelegate? { get set }
    var actionDelegate: RSSViewModelActionDelegate? { get set }
    
    func sectionTitles(at section: Int) -> String?
    func cellCount(at section: Int) -> Int 
    func sectionCount() -> Int
    func viewModelForCell(section: Int, index: Int) -> NewsTableViewCellViewModel?
    func updateNews()
    func selectRow(at section: Int, index: Int)
}
