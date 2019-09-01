//
//  WebViewController.swift
//  RSSReader
//
//  Created by Savely on 02/09/2019.
//  Copyright © 2019 Test App. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView?
    
    var viewModel: WebViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = viewModel?.url() {
            let request = URLRequest(url: url)
            webView?.load(request)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    } 
}
