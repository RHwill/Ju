//
//  MainClassicalCell.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/16.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class MainClassicalCell: UITableViewCell {
    
    var showImage   : UIImageView?
    var firstTitle  : UILabel?
    var subTitle    : UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    func setUpUI() {
        showImage = UIImageView.init(frame: CGRectMake(5, 5, SCREENWIDTH-10, 170))
        showImage!.layer.masksToBounds = true
        self.addSubview(showImage!)
        
        subTitle = UILabel.init(frame: CGRectMake(10, 150, (showImage?.frame.size.width)!-20, 12))
        subTitle?.font = UIFont.systemFontOfSize(15)
        subTitle?.textAlignment = NSTextAlignment.Center
        subTitle?.textColor = UIColor.redColor()
        self.addSubview(subTitle!)
        
        firstTitle = UILabel.init(frame: CGRectMake(10, CGRectGetMinY((subTitle?.frame)!)-38, (subTitle?.frame.size.width)!, 30))
        firstTitle?.font = UIFont.systemFontOfSize(18)
        firstTitle?.textAlignment = NSTextAlignment.Center
        firstTitle?.textColor = UIColor.blueColor()
        self.addSubview(firstTitle!)
    }

    func setValueForCell(dic: NSDictionary) {
        subTitle!.text = "45道菜谱"
        firstTitle!.text = "世界各地大排档的招牌美食"
        showImage!.image = UIImage(imageLiteral: "img.jpg")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
