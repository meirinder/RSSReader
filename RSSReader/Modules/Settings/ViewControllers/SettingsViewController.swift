//
//  SettingsViewController.swift
//  RSSReader
//
//  Created by Savely on 01/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var viewModel: SettingsViewModel?
    
    @IBOutlet private weak var feedsTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        feedsTableView?.tableFooterView = UIView()
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsIdentifier", for: indexPath)
        guard let config = viewModel?.cellNameAndImage(at: indexPath.row) else { return cell}
        cell.textLabel?.text = config.name
        cell.imageView?.image = config.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard let viewModel = viewModel else { return .none }
        if indexPath.row == viewModel.cellCount() - 1 {
            return .none
        }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            viewModel?.deleteFeed(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        } 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if indexPath.row == viewModel.cellCount() - 1 {
            let alert = UIAlertController(title: "Add new feed", message: "Write a new valid rss address", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                if let textField = alert.textFields?.first, let text = textField.text {
                    viewModel.checkFeedLink(string: text) 
                }
            }))
            alert.addTextField { (textField) in
                textField.placeholder = "https://someresource.ru/rss"
            }
            present(alert, animated: true, completion: nil)
        } else {
            viewModel.updateState(at: indexPath.row)
        }
    }
    
}

extension SettingsViewController: SettingsViewModelDelegate {
    func settingsViewModel(settingsViewModel: SettingsViewModel, show error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        present(alert, animated: true, completion: nil)
    }
    
    func settingsViewModelUpdateFeeds(settingsViewModel: SettingsViewModel) {
        DispatchQueue.main.async {
            self.feedsTableView?.reloadData()
        }
    } 
}
