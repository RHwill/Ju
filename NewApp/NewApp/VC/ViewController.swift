//
//  ViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON

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
            Network.manager.requestGetData(URLString: url_qdaily, successBlcok: { (returnResult) in
                
                let info = JSON(returnResult as Any)
                let banner = info["response"]["feeds"]
                self.newsData.removeAll()
                for (_, subJSON) in banner {
                    let banners = subJSON["post"]
                    
                    let modelData = self.jsonAddModel(banners: banners)
                    
                    self.newsData.append(modelData)
                }
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                    self.newsTableView.mj_header.endRefreshing()
                }
            }, failureBlock: { (error) in
                self.newsTableView.mj_header.endRefreshing()
            })
        });
        newsTableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(refreshMoreData))
        self.view.addSubview(newsTableView)
    }
    
    @objc func refreshMoreData() {
        Network.manager.requestGetData(URLString: url_qdaily_more, successBlcok: { (response) in
            let info = JSON(response)
            let banner = info["response"]["feeds"]
            for (_, subJSON) in banner {
                let banners = subJSON["post"]

                let moerModel = self.jsonAddModel(banners: banners)

                self.newsData.append(moerModel)
            }
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
                self.newsTableView.mj_header.endRefreshing()
                self.newsTableView.mj_footer.resetNoMoreData()
            }
        }) { (error) in
            self.newsTableView.mj_footer.endRefreshing()
        }
    }
    
    func jsonAddModel(banners: JSON) -> Model {
        
        let modelData = Model()
        
        var url = banners["appview"].stringValue
        
        if url.isEmpty {
            url = "http://www.jianshu.com/p/4ea427bab0af"
        }
        modelData.url = url
        
        let title = banners["title"].stringValue
        modelData.title = title
        
        var image = banners["image"].stringValue
        if image.isEmpty {
            image = "http://img.qdaily.com/article/article_show/20161110122926LJBdCEmQtRVzhGji.png?imageMogr2/auto-orient/thumbnail/!640x380r/gravity/Center/crop/640x380/quality/85/format/jpg/ignore-error/1"
        }
        modelData.image = image
        return modelData
    }
    
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

