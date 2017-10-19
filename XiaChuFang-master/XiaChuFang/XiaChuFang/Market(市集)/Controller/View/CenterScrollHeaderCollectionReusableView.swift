//
//  CenterScrollHeaderCollectionReusableView.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/8.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class CenterScrollHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollArray : Array<UIImage>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.scrollArray = [UIImage(named: "1111.jpg")!, UIImage(named: "2222.jpg")!, UIImage(named: "3333.jpg")!, UIImage(named: "4444.jpg")!, UIImage(named: "5555.jpg")!, UIImage(named: "6666.jpg")!, UIImage(named: "7777.jpg")!]
        
        
//        for imgs in self.scrollArray {
//
//        }
        for index in 0...self.scrollArray.count {
            let scrollImage = UIImageView.init(image: self.scrollArray[index])
            let indexF = CGFloat(index)
            scrollImage.frame = CGRect(x:15+indexF*(80+10), y:0, width:80, height:90)
            scrollView.addSubview(scrollImage)
        }
        
        let countF = CGFloat(self.scrollArray.count)
//        scrollView.contentOffset = CGPoint(20+countF*(80+10), 0)
        scrollView.contentSize = CGSize(width:20+countF*(80+10), height:0)
        scrollView.showsHorizontalScrollIndicator = false
        
    }
    
}
