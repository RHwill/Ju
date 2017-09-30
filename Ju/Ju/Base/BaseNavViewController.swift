//
//  BaseNavViewController.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/28.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftTheme

class BaseNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 0)
        let titleAttributes: [[NSAttributedStringKey : NSObject]] = globalBarTextColors.map { hexString in
            return [
                NSAttributedStringKey.foregroundColor: UIColor(rgba: hexString),
                NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16),
                NSAttributedStringKey.shadow: shadow
            ]
        }
        
        self.navigationBar.isTranslucent = false;
        self.navigationBar.theme_tintColor = globalBarTextColorPicker
        self.navigationBar.theme_barTintColor = globalBarTintColorPicker
        self.navigationBar.theme_titleTextAttributes = ThemeDictionaryPicker.pickerWithDicts(titleAttributes)
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
