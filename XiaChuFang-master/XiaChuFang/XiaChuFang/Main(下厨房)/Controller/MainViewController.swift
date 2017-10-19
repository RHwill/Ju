//
//  MainViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/15.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MainHeaderViewDelegate, CirCleViewDelegate, UISearchBarDelegate {
    
    // 单行注释
    /*  多行注释  */
    /// 标记注释1
    /** 标记注释2 */
    
    // MARK: - 注释方法集
    // TODO: - 注释方法集
    
    var mainTable: UITableView?
    var mainArray: NSMutableArray?
    
    var headerView: MainHeaderView?
    
    var searchBar:  UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "下厨房"
        
        self.layoutNavigationBar()
        self.loadDataSource()
        self.setUpTable()
        
        print("aaaaaaaaaaaa")
    }
    
    // MARK: - tableView Delegate && tableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        print(mainArray!.count)
        return (mainArray?.count)!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var sectionArr = NSMutableArray()
        sectionArr = mainArray![section] as! NSMutableArray
        print(sectionArr.count)
        
        return sectionArr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "mainCell"
        let cell = MainClassicalCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        
        //下面两个属性对应subtitle
//        cell.firstTitle?.text = mainArray![indexPath.row] as? String
//        cell.subTitle?.text = mainArray![indexPath.row] as? String
        var sectionArr = NSMutableArray()
        sectionArr = mainArray![indexPath.section] as! NSMutableArray
        
        var dic = Dictionary<String, String>()
        dic["name"] = sectionArr[indexPath.row] as? String
        cell.setValueForCell(dic: dic)
        
        //添加照片
//        cell.showImage?.image = UIImage(named: mainArray![indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerArray = NSArray()
        headerArray = Bundle.main.loadNibNamed("MainClassicalSectionHeaderView", owner: nil, options: nil)! as NSArray
        
        let sectionHeaderView = headerArray.firstObject as! MainClassicalSectionHeaderView

        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000000001
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        // 实例化一个将要跳转的viewController
        let detailVC = MainDetailVC()
        // 跳转
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK:- MainHeaderViewDelegate 协议方法
    // MARK:  MainHeaderView顶部两个大按钮的点击事件
    func mainHeaderViewTopBtnClick(title: NSString) {
        print("title====\(title)")
        if title.isEqual(to: "left") {
            // MainHeaderView左上角点击事件
            print("MainHeaderView左上角点击事件")
        } else {
            // MainHeaderView右上角点击事件
            print("MainHeaderView右上角点击事件")
        }
    }
    
    // MARK:  MainHeaderView中间四个小按钮的点击事件
    func mainHeaderViewCenterBtnsClick(sender: CustomCentBtn) {
        print("centerBtn.title====\(String(describing: sender.titlLab.text))")
    }
    
    // MARK:-  MainHeaderView底部轮播图点击事件
    func clickCurrentImage(currentIndxe: Int) {
        print("选中图片下标====\(currentIndxe)")
    }
    
    
    // MARK:- UISearchBarDelegate
    // MARK: 输入框内容改变触发事件
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("输入框内容改变触发事件：\(searchText)")
    }
    
    // MARK: 书签按钮触发事件
    internal func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("搜索历史")
    }
    
    // MARK: 取消按钮触发事件
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("取消搜索")
    }

    // MARK: 搜索触发事件
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("开始搜索")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("开始编辑")
        let searchVC = SearchViewController()
        searchVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(searchVC, animated: true)
        return false
    }
    
    // MARK:- loadDataSource
    func loadDataSource() {
        
        let path = Bundle.main.path(forResource: "mainListPlist", ofType: "plist")
        let sourceArr = NSMutableArray.init(contentsOfFile: path!)
        
        mainArray = NSMutableArray.init(array: sourceArr!)

        self.mainTable?.reloadData()
    }
    
    
    // MARK:- LayoutUIs
    
    func setUpTable(){
        mainTable = UITableView.init(frame: CGRect(x:0, y:0, width:SCREENWIDTH, height:SCREENHEIGHT) , style: UITableViewStyle.grouped)
        mainTable!.delegate = self
        mainTable!.dataSource = self
        mainTable!.backgroundColor = UIColor.white
        self.view.addSubview(mainTable!)
        
        headerView = MainHeaderView.init(frame: CGRect(x:0, y:0, width:SCREENWIDTH, height:340))
        headerView?.delegate = self
        headerView?.circleView.imageArray = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg")]
        headerView?.circleView.delegate = self
        mainTable?.tableHeaderView = headerView
    }
    
    @objc func leftBtnAction() {
        
    }
    
    // MARK: SearchBar
    func layoutNavigationBar() {
        searchBar = UISearchBar(frame: CGRect.init(x: 30, y: 20, width: SCREENWIDTH-60, height: 40))
        searchBar?.placeholder = "菜谱、食材"
        searchBar?.barStyle = UIBarStyle.default
        searchBar?.barTintColor = UIColor.darkGray
        searchBar?.tintColor = UIColor.black
        searchBar?.isTranslucent = true
        searchBar?.showsBookmarkButton = false
        searchBar?.showsCancelButton = false
        searchBar?.showsSearchResultsButton = false
        searchBar?.showsScopeBar = false
        searchBar?.showsScopeBar = false
        searchBar?.delegate = self
        
        self.navigationItem.titleView = searchBar
        
        let leftBtn = UIButton.init(frame: CGRect(x:0, y:0, width:20, height:20))
        leftBtn.setImage(UIImage(imageLiteralResourceName: "jiahao"), for: UIControlState.normal)
        leftBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        leftBtn.addTarget(self, action:#selector(leftBtnAction), for: UIControlEvents.touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightBtn = UIButton.init(frame: CGRect(x:0, y:0, width:20, height:20))
        rightBtn.setImage(UIImage(imageLiteralResourceName: "cailan"), for: UIControlState.normal)
        rightBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        rightBtn.addTarget(self, action:#selector(leftBtnAction), for: UIControlEvents.touchUpInside)
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightItem
        
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
