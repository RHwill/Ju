//
//  BaseView.swift
//  Ju
//
//  Created by 蔡荣辉 on 2017/9/28.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftTheme

class BaseView: UIView {

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.theme_backgroundColor = globalBackgroundColorPicker
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
