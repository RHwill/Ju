//
//  ViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import MJRefresh


fileprivate let cellString = "newCell"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var newsTableView: UITableView!
    var newsData: Array<Model>! = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "首页"
        self.setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newsTableView.mj_header.beginRefreshing()
    }
    
    func setupView() {
        newsTableView = UITableView.init(frame: self.view.frame, style: .plain)
        newsTableView.dataSource = self;
        newsTableView.delegate = self;
        newsTableView.rowHeight = 120;
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellString)
        newsTableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            
            ViewModel.manager.newNews(URLString: url_qdaily, finishBlock: { (returnResult) in
                self.newsData.removeAll()
                self.newsData = returnResult
                if !self.newsData.isEmpty {
                    self.newsTableView.reloadData()
                    self.newsTableView.mj_header.endRefreshing()
                }
                self.newsTableView.mj_header.endRefreshing()
            })
        });
        newsTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(refreshMoreData))
        self.view.addSubview(newsTableView)
    }
    
    @objc func refreshMoreData() {
        
        ViewModel.manager.moreNews(URLString: url_qdaily_more) { (moreNews) in
            
            if !moreNews.isEmpty {
                let mutaleArr = NSMutableArray.init(array: moreNews)
                mutaleArr.add(self.newsData)
                self.newsData = mutaleArr as! Array<Model>
                
                self.newsTableView.reloadData()
                self.newsTableView.mj_footer.resetNoMoreData()
            }
            self.newsTableView.mj_header.endRefreshing()
        }
    }
    
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count > 0 ? newsData.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellString, for: indexPath) as! NewsTableViewCell
        print(cell.frame)
        cell.cellModel = self.newsData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let didModel = self.newsData[indexPath.row]
        self.pushWebController(didModel.url)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func pushWebController(_ URLString:String) {
        let webVC = WebViewController()
        webVC.urlString = URLString
        self.navigationController?.pushViewController(webVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

