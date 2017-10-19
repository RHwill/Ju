//
//  SetUpViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/20.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class SetUpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SetUpHeaderViewDelegate {
    
    

    @IBOutlet weak var setUpTableView: UITableView!
    var dataSource: NSMutableArray!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = true
        
        dataSource = NSMutableArray.init(array: [["账号管理", "设置密码", "收货地址"], ["发现好友", "消息推送"], ["把下厨房告诉好友", "帮助下厨房评分"]])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let leftBtn = UIButton.init(frame: CGRect(x:10, y:10, width:20, height:20))
        leftBtn.setImage(UIImage(imageLiteralResourceName: "back"), for: UIControlState.normal)
        leftBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        leftBtn.addTarget(self, action: #selector(leftBtnAction), for: .touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
        self.title = "设置"
        
        self.layoutUIs()
    }
    
    func leftBtnAction(sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellArray = NSArray.init(array: self.dataSource.object(at: section) as! NSArray)
            return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 80
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            var headerArray = Array<Any>()
            headerArray = Bundle.main.loadNibNamed("SetUpHeaderView", owner: nil, options: nil)!
            
            let setUpHeaderView = headerArray.firstObject as! SetUpHeaderView
            setUpHeaderView.delegate = self
            return setUpHeaderView
        } else {
            let headerView = UIView.init(frame: CGRect(0, 0, SCREENWIDTH, 80))
            headerView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
            headerView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
            return headerView
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "detailCell")
        cell.backgroundColor = UIColor.white
        let cellArray = NSArray.init(array: self.dataSource.object(at: indexPath.section) as! NSArray)
        cell.textLabel?.text = cellArray.object(at: indexPath.row) as? String
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
    
    // MARK : - SetUpHeaderViewDelegate
    func tapAction() {
        print("点击头部跳转个人详情设置页面")
        let editVC = EditPersonalController()
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    func layoutUIs() {
        self.setUpTableView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
        self.setUpTableView.tableFooterView = UIView.init()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
