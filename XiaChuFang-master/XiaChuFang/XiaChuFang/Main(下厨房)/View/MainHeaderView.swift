//
//  MainHeaderView.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/3/16.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

protocol MainHeaderViewDelegate: class {
    func mainHeaderViewTopBtnClick(title: NSString)
    func mainHeaderViewCenterBtnsClick(sender: CustomCentBtn)
}

class MainHeaderView: UIView {
    
    weak var delegate       : MainHeaderViewDelegate?
    
    /*
     * 顶部两个大按钮
     */
    var leftBtn        : UIImageView!
    var rightBtn       : UIImageView!
    var leftTitle      : UILabel!
    var rightTitle     : UILabel!
    var leftCenterImg  : UIImageView!
    var rightCenterImg : UIImageView!
    
    /*
     * 中间展示条
     */
    var BTNBASETAG     : CGFloat = 1234567
    var centerTitle    : UILabel!
    
    /*
     * 底部轮播图
     */
    var circleView     : CirCleView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initBaseLayout()
    }
    
    @objc func leftTapAction() {
        print("左上角点击事件")
        if let _delegate = delegate {
            _delegate.mainHeaderViewTopBtnClick(title: "left")
        }
    }
    
    @objc func rightTapAction() {
        print("右上角点击事件")
        if let _delegate = delegate {
            _delegate.mainHeaderViewTopBtnClick(title: "right")
        }
    }
    
    @objc func centerBtnsTapAction(sender: CustomCentBtn) {
        print("点我了")
        if let _delegate = delegate {
            _delegate.mainHeaderViewCenterBtnsClick(sender: sender)
        }
    }
    
    
    func initBaseLayout() {
        self.topTwoBtnLayout()
        self.centerButtonsAndTipLayout()
        self.bottomScrollLayout()
    }
    
    /*******************************  底部轮播图  **************************/
    func bottomScrollLayout() {
        let imageArray: [UIImage?] = [UIImage(named: "tx2.jpg"), UIImage(named: "tx3.jpg"), UIImage(named: "tx4.jpg")]
        
        self.circleView = CirCleView(frame: CGRect(x: 0, y: 260, width: SCREENWIDTH, height: 80), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orange
        self.addSubview(circleView)
    }
    
    /*******************************  中间区域小按钮和展示Label  **************************/
    func centerButtonsAndTipLayout() {
        let centerArray = NSMutableArray.init(array:["排行榜", "看视频", "买买买", "菜谱分类"])
        for (index, string) in centerArray.enumerated() {
            print(string)
            print(index)
            let countF = CGFloat(centerArray.count)
            let indexF = CGFloat(index)
            
            let centerBtn = CustomCentBtn.init(frame: CGRect(x: indexF*(SCREENWIDTH/countF), y: leftBtn.frame.size.height, width: SCREENWIDTH/countF, height: 80))
            centerBtn.backgroundColor = UIColor.white
            centerBtn.tag = Int((indexF + 1.0) * BTNBASETAG)
            //            centerBtn.smallImg.image = UIImage(imageLiteralResourceName: "\(indexF)")
            centerBtn.titlLab.text = string as? String
            centerBtn.addTarget(self, action: #selector(centerBtnsTapAction), for: UIControlEvents.touchUpInside)
            self.addSubview(centerBtn)
        }
        
        centerTitle = UILabel.init(frame: CGRect(x: 0, y: leftBtn.frame.size.height+80, width: SCREENWIDTH, height: 50))
        centerTitle.backgroundColor = XCFColor(r: 249, g: 241, b: 209)
        centerTitle.textColor = XCFColor(r: 234, g: 150, b: 136)
        centerTitle.font = UIFont.systemFont(ofSize: 15)
        centerTitle.text = "新用户可领取20元红包"
        centerTitle.textAlignment = NSTextAlignment.center
        self.addSubview(centerTitle)
        
    }
    
    /*******************************  顶部两个大按钮  **************************/
    func topTwoBtnLayout() {
        leftBtn = UIImageView.init(frame: CGRect(x:0, y: 0, width:SCREENWIDTH/2-1, height: 130))
        leftBtn.isUserInteractionEnabled = true
        leftBtn.backgroundColor = UIColor.cyan
        self.addSubview(leftBtn)
        
        leftCenterImg = UIImageView.init(frame: CGRect(x: leftBtn.frame.size.width/2-10, y: leftBtn.frame.size.height/2-10, width:30, height: 30))
        leftCenterImg.isUserInteractionEnabled = true
        leftCenterImg.backgroundColor = UIColor.green
        leftCenterImg.layer.cornerRadius = 15
        leftCenterImg.layer.masksToBounds = true
        leftBtn.addSubview(leftCenterImg)
        
        leftTitle = UILabel.init(frame: CGRect(x: 15, y: leftBtn.frame.size.height-30, width: leftBtn.frame.size.width-25, height:15))
        leftTitle.font = UIFont.systemFont(ofSize: 15)
        leftTitle.textColor = UIColor.white
        leftTitle.textAlignment = NSTextAlignment.center
        leftTitle.text = "本周流行菜谱"
        leftBtn.addSubview(leftTitle)
        
        
        rightBtn = UIImageView.init(frame: CGRect(x: leftBtn.frame.size.width+2, y:0, width:leftBtn.frame.size.width, height:leftBtn.frame.size.height))
        rightBtn.isUserInteractionEnabled = true
        rightBtn.backgroundColor = UIColor.yellow
        self.addSubview(rightBtn)
        
        rightCenterImg = UIImageView.init(frame: CGRect(x:rightBtn.frame.size.width/2-10, y:rightBtn.frame.size.height/2-10, width:30, height:30))
        rightCenterImg.isUserInteractionEnabled = true
        rightCenterImg.backgroundColor = UIColor.orange
        rightCenterImg.layer.cornerRadius = 15
        rightCenterImg.layer.masksToBounds = true
        rightBtn.addSubview(rightCenterImg)
        
        rightTitle = UILabel.init(frame: CGRect(x:15, y:leftTitle.frame.origin.y, width:leftBtn.frame.size.width-25, height:15))
        rightTitle.font = UIFont.systemFont(ofSize: 15)
        rightTitle.textColor = UIColor.white
        rightTitle.textAlignment = NSTextAlignment.center
        rightTitle.text = "看看大家的作品"
        rightBtn.addSubview(rightTitle)
        
        
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(leftTapAction))
        leftCenterImg.addGestureRecognizer(leftTap)
        leftBtn.addGestureRecognizer(leftTap)
        
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(rightTapAction))
        rightCenterImg.addGestureRecognizer(rightTap)
        rightBtn.addGestureRecognizer(rightTap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpUI() {
        
//        leftBtn.frame = CGRect(0, 0, UIScreen.mainScreen().bounds.size.width/2, 120)
        
//        let rightBtn: UIButton?
        
    }
    
}
