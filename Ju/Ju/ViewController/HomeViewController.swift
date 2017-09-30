//
//  HomeViewController.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/26.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

fileprivate let cellID = "tableViewCell"

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "家"
        tableview()
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableview() {
    
        let homeTableView  = UITableView.init(frame: self.view.frame, style: .plain)
        homeTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

        homeTableView.delegate = self as UITableViewDelegate;
        homeTableView.dataSource = self as UITableViewDataSource;
        self.view.addSubview(homeTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID);
        cell?.textLabel?.text = "测试数据"
        return cell!
        
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
