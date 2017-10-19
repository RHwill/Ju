//
//  TabeBarViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/16.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class TabeBarViewController: UITabBarController {

    var tabBarBgImg:UIImageView?
    var tabBarBgImgSelected:UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
         * 更改tabBar选中按钮的颜色
         */
//        self.tabBar.tintColor = UIColor.redColor()
        
        self.setUpAllChildViewController()
    }
    
    
    func setUpAllChildViewController() {
        
        self.setUpOneChildViewController(MainViewController(), image: UIImage.init(named: "main_off")!, selectedImage: UIImage.init(named: "main_on")!, title: "下厨房")
        
        self.setUpOneChildViewController(MarketViewController(), image: UIImage.init(named: "market_off")!, selectedImage: UIImage.init(named: "market_on")!, title: "市集")
        
        self.setUpOneChildViewController(CommunityVC(), image: UIImage.init(named: "community_off")!, selectedImage: UIImage.init(named: "community_on")!, title: "社区")
        
        self.setUpOneChildViewController(MeViewController(), image: UIImage.init(named: "me_off")!, selectedImage: UIImage.init(named: "me_on")!, title: "我")
    }
    
    
    func setUpOneChildViewController(viewController: UIViewController, image: UIImage, selectedImage: UIImage, title: NSString) {
        
        let navVC = UINavigationController.init(rootViewController: viewController)
        
        // 让图片显示图片原始颜色  “UIImage” 后+ “.imageWithRenderingMode(.AlwaysOriginal)”
        navVC.tabBarItem = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.imageWithRenderingMode(.AlwaysOriginal))
        
        self.addChildViewController(navVC)
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
