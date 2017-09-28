//
//  JuViewController.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/26.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftTheme

class JuViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchs = UISwitch.init(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        switchs.addTarget(self, action: #selector(changeColor), for: UIControlEvents.editingChanged)
        view.addSubview(switchs)
        // Do any additional setup after loading the view.
    }
    
    @objc func changeColor(_ sw: UISwitch) {
        ThemeManager.setTheme(index: 4)
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
