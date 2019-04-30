//
//  ViewController.swift
//  SwiftWKWebView
//
//  Created by Kiyoto Ryuman on 2019/04/30.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    var urlString:String = "https://beautydatsumo.com"
    var indicator:UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: urlString)
            else{
            return
        }
        let req = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 100)
        setIndicator()
        self.webView.load(req)
        
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func next(_ sender: Any) {
        webView.goForward()
    }
    
    func setIndicator(){
        indicator = UIActivityIndicatorView()
        
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        indicator.hidesWhenStopped = true
        indicator.style = .gray
        
        self.webView.addSubview(indicator)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}

