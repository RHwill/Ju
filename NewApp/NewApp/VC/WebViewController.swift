//
//  WebViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    var urlString: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView.init(frame: self.view.frame)
        webView.delegate = self
        webView.loadRequest(URLRequest(url: URL(string: urlString)!))
        self.view.addSubview(webView)
        
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
//        self.title = webView.stringByEvaluatingJavaScript(from: "document.title")
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.title = webView.stringByEvaluatingJavaScript(from: "document.title")
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
