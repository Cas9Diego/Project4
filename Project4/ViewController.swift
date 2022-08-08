//
//  ViewController.swift
//  Project4
//
//  Created by Diego Castro on 07/08/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action:#selector (openTapped))
        
        let url = URL (string: "https://www.google.com/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openTapped () {
        let ac = UIAlertController(title: "Open Page", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present (ac, animated: true)
    }
    
    func openPage (action: UIAlertAction) {
        let url = URL(string: "https://"+action.title!)!
        webView.load(URLRequest(url: url))
    }


}

