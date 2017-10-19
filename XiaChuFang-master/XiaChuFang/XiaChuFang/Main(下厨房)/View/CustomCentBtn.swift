//
//  CustomCentBtn.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/25.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class CustomCentBtn: UIButton {
    
    var smallImg         : UIImageView!
    var titlLab          : UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initBaseLayout()
    }
    
    func initBaseLayout() {
        smallImg = UIImageView.init(frame: CGRect(x:SCREENWIDTH/4/2-10, y:20, width:20, height:20))
        smallImg.backgroundColor = UIColor.red
        self.addSubview(smallImg)
        
        titlLab = UILabel.init(frame: CGRect(x:5, y:(smallImg.frame).maxY+10, width:SCREENWIDTH/4-10, height:12))
        titlLab.font = UIFont.systemFont(ofSize: 11)
        titlLab.textAlignment = NSTextAlignment.center
        titlLab.textColor = XCFColor(r: 102, g: 102, b: 102)
        self.addSubview(titlLab)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
