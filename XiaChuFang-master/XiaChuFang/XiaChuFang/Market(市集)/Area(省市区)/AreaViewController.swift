//
//  AreaViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var areaTable : UITableView?
    var addHeaders:[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "选择地区"
        
        let leftBtn = UIButton.init(frame: CGRect(x:10, y:10, width:60, height:20))
        leftBtn.setTitle("取消", for: UIControlState.normal)
        leftBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        leftBtn.addTarget(self, action:#selector(leftBtnAction), for: UIControlEvents.touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
        self.creatTable()
    }
    
    @objc func leftBtnAction(sender: UIButton) {
        self.navigationController!.dismiss(animated: true, completion: nil)
    }
    //实现索引数据源代理方法
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return addHeaders
    }
    
    //点击索引，移动TableView的组位置
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String,
                   at index: Int) -> Int {
            var tpIndex:Int = 0
            //遍历索引值
            for character in addHeaders{
                //判断索引值和组名称相等，返回组坐标
                if character == title{
                    return tpIndex
                }
                tpIndex += 1
            }
            return 0
    }
    
    
    //设置分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return addHeaders.count;
    }
    
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    private func tableView(tableView:UITableView, titleForHeaderInSection
        section:Int)->String?
    {
        var headers =  self.addHeaders;
        return headers[section];
    }
    
    //设置分组尾部高度（不需要尾部，设0.0好像无效）
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath as IndexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        let secno = indexPath.section
        cell.textLabel?.text = self.addHeaders[secno]+String(indexPath.item)
        return cell
    }
    
    func creatTable() {
        self.areaTable = UITableView(frame:CGRect(x:0, y:64, width:SCREENWIDTH, height:SCREENHEIGHT-64), style: .plain)
        self.areaTable?.delegate = self
        self.areaTable?.dataSource = self
        //创建一个重用的单元格
        self.areaTable!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.areaTable!)
        self.areaTable?.backgroundColor = UIColor.white
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
