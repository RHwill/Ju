//
//  MainViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/24.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

let cellID = "mainTableViewCellID"
class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var mainTableView: UITableView!
    var mainData: Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "列表"
        mainData = ["NEWAPP"]
        
        mainTableView = UITableView.init(frame: self.view.frame)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(mainTableView)
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - tableviewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = mainData[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ViewController(), animated: true)
            break
        default:
            break
            
        }
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
