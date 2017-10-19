//
//  ScreenViewController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/21.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

class ScreenViewController: UIViewController , LJAnimationViewDelegate {
    
    var backImg: UIImageView!
    var animationView = LJAnimationView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.clear
        
        backImg = UIImageView.init(frame: CGRect(x:0, y:0, width:SCREENWIDTH, height:SCREENHEIGHT))
        backImg.image = UIImage.init(named: "LaunchImage")
        backImg.alpha = 0.4
        self.view.addSubview(backImg)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addAnimationView()
    }
    
    func addAnimationView() {
        let size: CGFloat = 100.0
        
        animationView.frame = CGRect(x:self.view.frame.width/2 - size/2, y:self.view.frame.height/2 - size/2, width:size, height:size)
        animationView.parentFrame = view.frame
        animationView.delegate = self
        view.addSubview(animationView)
    }
    
    // MARK: -
    // MARK: AnimationViewDelegate
    func completeAnimation() {
        backImg.removeFromSuperview()
        // 1
        animationView.removeFromSuperview()
        view.backgroundColor = UIColor.colorWithHexString(hex: "#40e0b0")
        
//        // 2
//        let label: UILabel = UILabel(frame: view.frame)
//        label.textColor = UIColor.white
//        label.font = UIFont(name: "HelveticaNeue-Thin", size: 50.0)
//        label.textAlignment = NSTextAlignment.Center
//        label.text = "Welcome"
//        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
//        view.addSubview(label)
//        
//        // 3
//        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: UIViewAnimationOptions.CurveEaseInOut,animations: ({
//            
//            label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0)
//        }), completion: { finished in
//            self.addTouchButton()
//        })
     
        self.btnClick()
    }
    
    func addTouchButton() {
        let button = UIButton()
        button.frame = CGRect(x:0.0, y:0.0, width:view.bounds.width, height:view.bounds.height)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func btnClick() {
        view.backgroundColor = UIColor.white
        view.subviews.forEach { (
            $0.removeFromSuperview()
            )}
        animationView = LJAnimationView(frame: CGRect.zero)
        
        //初始化tabbar
        let tabbarVC = TabeBarViewController()
        UIApplication.shared.keyWindow?.rootViewController = tabbarVC
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

