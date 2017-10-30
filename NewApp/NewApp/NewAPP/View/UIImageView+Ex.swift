//
//  UIImageView+Ex.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func downloadImage(url:String, placeholder:String) {
        self.sd_setImage(with:URL(string:url), placeholderImage:UIImage.init(named: placeholder), options:[.retryFailed, .lowPriority])
    }
}

