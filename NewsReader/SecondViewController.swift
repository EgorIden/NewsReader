//
//  SecondViewController.swift
//  NewsReader
//
//  Created by Egor on 11.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var webURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.startAnimating()
        updateURL()
    }
    func updateURL(){
        if let url = webURL{
            let urlRequest = URLRequest(url: url)
            self.indicator.stopAnimating()
            webView.load(urlRequest)
        }
    }
}
