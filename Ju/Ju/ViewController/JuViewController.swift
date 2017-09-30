//
//  JuViewController.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/26.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftTheme

fileprivate let cellID = "JU_cellID"

class JuViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    var tableViewData = ["小咔对讲", "小咔广播", "好友"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let switchs = UISwitch.init(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        switchs.addTarget(self, action: #selector(changeColor), for: UIControlEvents.valueChanged)
        view.addSubview(switchs)
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func setupView() {
        let juTableView = UITableView.init(frame: self.view.frame, style: .plain)
        juTableView.backgroundColor = self.view.backgroundColor
        juTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        juTableView.dataSource = self
        juTableView.delegate = self
        self.view.addSubview(juTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = tableViewData[indexPath.row]
        return cell!
    }
    
    @objc func changeColor(_ sw: UISwitch) {
        ThemeControlType.switchNight(isToNight: sw.isOn)
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
