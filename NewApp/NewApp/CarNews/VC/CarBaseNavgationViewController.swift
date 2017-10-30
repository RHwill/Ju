//
//  CarBaseNavgationViewController.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/30.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

class CarBaseNavgationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navBarStyle()
        
        // Do any additional setup after loading the view.
    }
    
    func navBarStyle() {
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let barItem = UIBarButtonItem.appearance()
        barItem.tintColor = UIColor.white
        barItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17), NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(#imageLiteral(resourceName: "backgroundImage"), for: .default)
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
