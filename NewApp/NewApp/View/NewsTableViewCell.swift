//
//  NewsTableViewCell.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var rh_imageView: UIImageView!
    var rh_textLabel: UILabel!
    
    var cellModel: Model! {
        didSet{
            rh_textLabel?.text = cellModel.title
            print(cellModel.image)
            rh_imageView?.downloadImage(url:cellModel.image, placeholder:"defaultImage.jpg")
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        rh_imageView = UIImageView.init(frame: CGRect(x: 8, y: 8, width: 104, height: 104))
        self.contentView.addSubview(rh_imageView)
        
        rh_textLabel = UILabel.init(frame: CGRect(x: 120, y: 0, width: UIScreen.main.bounds.size.width - 120, height: 120))
        rh_textLabel?.font = UIFont.systemFont(ofSize: 17)
        rh_textLabel?.numberOfLines = 0
        self.contentView.addSubview(rh_textLabel)
        
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
