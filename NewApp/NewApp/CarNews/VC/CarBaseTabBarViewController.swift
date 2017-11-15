//
//  BaseTabBarViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/30.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // ERROR: -
        self.setupSubVC(vcClass: nil, imageName: "news", title: "汽车")
        self.setupSubVC(vcClass: nil, imageName: "text", title: "搞笑")
        self.setupSubVC(vcClass: nil, imageName: "live", title: "视频")
        self.setupSubVC(vcClass: nil, imageName: "mine", title: "我的")
    }
    
    func setupSubVC(vcClass: UIViewController!, imageName: String!, title: String!) {
        
        let baseNav = CarBaseNavgationViewController(rootViewController: vcClass)
        baseNav.title = title
        baseNav.tabBarItem.image = UIImage(named: imageName)

        baseNav.tabBarItem.selectedImage = UIImage(named: imageName + "_s")?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(baseNav)
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
