//
//  MeViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/15.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MeHeaderViewDelegate {
    
    

    @IBOutlet weak var meTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我"
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.layoutNavigationBar()
    }
    
    // MARK: - UITableViewDelegate && UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 182+44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerArray = Bundle.main.loadNibNamed("MeHeaderView", owner: nil, options: nil)
        let sectionHeaderView = headerArray?.first as! MeHeaderView
        sectionHeaderView.delegate = self
        return sectionHeaderView
    }
    
    // MARK: - MeHeaderViewDelegate
    func meHeaderViewCollectAndOrderAndDiscountAndIntegralActions(sender: UIButton) {
        if sender.tag == 110 {
            // MARK: - 默认样式，注意：Swift中必须声明是iOS8.0以上才执行UIAlertController相关的代码，否则会报错
            if #available(iOS 8.0, *) {
                let alertController = UIAlertController(title: "收藏", message: "这个是UIAlertController的默认样式", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
            
            
        } else if sender.tag == 220 {
            if #available(iOS 8.0, *) {
                // MARK: 警示样式
                let alertController = UIAlertController(title: "订单", message: "这个是UIAlertController的警示样式", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "警示", style: UIAlertActionStyle.destructive, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
            print("订单")
        } else if sender.tag == 330 {
            print("优惠")
            if #available(iOS 8.0, *) {
                // MARK: 文本对话框
                let alertController = UIAlertController(title: "优惠", message: "这个是UIAlertController的文本对话框", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
                    textField.placeholder = "登录"
                    
                    // 添加监听代码，监听文本框变化时要做的操作
                    NotificationCenter.default.addObserver(self, selector: #selector(self.lertTextFieldDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
                })
                
                alertController.addTextField(configurationHandler: { (textField: UITextField!) -> Void in
                    textField.placeholder = "密码"
                    textField.isSecureTextEntry = true
                })
                
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default , handler: { (action: UIAlertAction!) -> Void in
                    let login = (alertController.textFields?.first)! as UITextField
                    let password = (alertController.textFields?.last)! as UITextField
                    print("loginStr===\(String(describing: login.text))，passWordStr===\(String(describing: password.text))")
                    
                    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
                    
                })
                okAction.isEnabled = false
                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }
        } else if sender.tag == 440 {
            print("积分")
            // MARK: 上拉菜单
            if #available(iOS 8.0, *) {
                let alertController = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复", preferredStyle: UIAlertControllerStyle.actionSheet)
                // 如果上拉菜单中有“取消”按钮的话，那么它永远都会出现在菜单的底部，不管添加的次序是如何（就是这么任性）。其他的按钮将会按照添加的次序从上往下依次显示
                let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
                let deleteAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.destructive, handler: nil)
                let archiveAction = UIAlertAction(title: "保存", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(deleteAction)
                alertController.addAction(archiveAction)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                // Fallback on earlier versions
            }

        }
    }
    
    // MARK: - 用户名长度超过3个字符才可以点击“好的”按钮
     @objc func lertTextFieldDidChange(notification: NSNotification){
        if #available(iOS 8.0, *) {
            let alertController = self.presentedViewController as! UIAlertController?
            if (alertController != nil) {
                let login = (alertController!.textFields?.first)! as UITextField
                let okAction = alertController!.actions.last! as UIAlertAction
                
                if login.text!.lengthOfBytes(using: String.Encoding.utf8) > 3 {
                    okAction.isEnabled = true
                } else {
                    okAction.isEnabled = false
                }
            }
            
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func meHeaderViewWorksBtnAndMenuBtnAction(sender: UIButton) {
        
        if sender.tag == 111 {
            print("作品")
        } else if sender.tag == 222 {
            print("菜谱")
        }
    }
    
    func layoutNavigationBar() {
//        let leftBtn = UIButton.init(frame: CGRect(0, 10, 20, 20))
//        leftBtn.setImage(UIImage(imageLiteralResourceName: "fenlei"), forState: UIControlState.normal)
//        leftBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.normal)
//        leftBtn.addTarget(self, action:"rightBarBtnAction", forControlEvents: UIControlEvents.TouchUpInside)
//        let leftItem = UIBarButtonItem.init(customView: leftBtn)
//        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightBtn = UIButton.init(frame: CGRect(x:0, y:10, width:20, height:20))
        rightBtn.setImage(UIImage(imageLiteralResourceName: "set"), for: UIControlState.normal)
        rightBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        rightBtn.addTarget(self, action: #selector(rightBarBtnAction), for: .touchUpInside)
        let rightItem = UIBarButtonItem.init(customView: rightBtn)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func rightBarBtnAction(sender: AnyObject) {
        let setUpController = SetUpViewController()
        self.navigationController?.pushViewController(setUpController, animated: true)
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
