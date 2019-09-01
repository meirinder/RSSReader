//
//  RSSViewController.swift
//  RSSReader
//
//  Created by Savely on 30/08/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class RSSViewController: UIViewController {

    @IBOutlet private weak var newsTableView: UITableView? 

    var viewModel: RSSViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView?.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        viewModel?.updateNews()
    }

}

extension RSSViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(at: indexPath.section, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.sectionTitles(at: section) 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellCount(at: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        cell.viewModel = viewModel?.viewModelForCell(section: indexPath.section, index: indexPath.row)
        cell.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension RSSViewController: RSSViewModelDisplayDelegate {
    func rssViewModelUpdateData(rssViewModel: RSSViewModel) {
        DispatchQueue.main.async {
            self.newsTableView?.reloadData()
        }
    } 
}
