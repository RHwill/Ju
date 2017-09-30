//
//  BaseTabBarViewController.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/28.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.isTranslucent = false;
        self.tabBar.theme_tintColor = globalBarTextColorPicker
        self.tabBar.theme_barTintColor = globalBarTintColorPicker
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
