//
//  ViewModel.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import Foundation

protocol ViewModel: class {
    func cellCount() -> Int
    func viewModelForCell(at index: Int) -> NewsTableViewCellViewModel 
}
