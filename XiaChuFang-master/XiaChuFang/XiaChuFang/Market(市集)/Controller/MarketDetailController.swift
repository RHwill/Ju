//
//  MarketDetailController.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/27.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//


import UIKit

class MarketDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DetailMarketReusableViewDelegate {
    
    @IBOutlet weak var detailMarketCollectionView: UICollectionView!
    
    var topClassicalArray: NSMutableArray?
    var detailMarkertArray: NSMutableArray?
    
    var detailMarketTitleStr: String?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = detailMarketTitleStr
        self.loadCollectionView()
        self.layoutNavigation()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (detailMarkertArray?.count)!
        return 10
    }

    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: DetailMarketCell = detailMarketCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailMarketCellIdentifier", for: indexPath as IndexPath) as! DetailMarketCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 2
        return cell

    }
    
    /*
    * 返回header的大小
    */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREENWIDTH, height: 80)
    }
    
    /*
    * 返回headview或者footview
    */
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            // 代码创建CollectionView的头视图
        let headerView:DetailMarketReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DetailMarketReusableView", for: indexPath as IndexPath) as! DetailMarketReusableView
        headerView.delegate = self
        headerView.backgroundColor = UIColor.white

            return headerView
    }
    
    func detailMarketReusableViewSelectedWithStr(titleStr: String) {
        print("\(titleStr)")
    }

    
    func loadCollectionView() {
        // 定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        // 设置cell的大小
        layout.itemSize = CGSize(width: (SCREENWIDTH-30)/2, height: (SCREENWIDTH-30)/2+50)
        // 滑动方向，默认方向是垂直方向
        layout.scrollDirection = .vertical
        // 每个Item之间最小间距
        layout.minimumInteritemSpacing = 10
        // 每行之间最小间距
        layout.minimumLineSpacing = 10
        // 上下左右边距
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        // 定义一个UICollectionView
        detailMarketCollectionView.collectionViewLayout = layout
        detailMarketCollectionView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
        
//        // CollectionViewCell的注册
        detailMarketCollectionView.register(UINib(nibName: "DetailMarketCell", bundle: nil), forCellWithReuseIdentifier: "DetailMarketCellIdentifier")
        
        // header的注册
        detailMarketCollectionView.register(DetailMarketReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DetailMarketReusableView")
    }
    
    
    func layoutNavigation() {
        let leftBtn = UIButton.init(frame: CGRect(x:10, y:10, width:20, height:20))
        leftBtn.setImage(UIImage(imageLiteralResourceName: "back"), for: UIControlState.normal)
        leftBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        leftBtn.addTarget(self, action:#selector(leftBtnAction), for: UIControlEvents.touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
    }
    
    @objc func leftBtnAction() {
        print("返回返回")
        //前提：确保当前ViewController是通过NavigationController的PushView方法跳转来的
        //方式一：跳转到前一个页面
        self.navigationController?.popViewController(animated: true)
        //实例化一个ViewController
        //        let firstView = FirstViewController()
        //        //方式二：返回至指定的ViewController
        //        self.navigationController?.popToViewController(viewController:  firstView , animated: true)
        //        //方式三：返回至最初的ViewController
        //        //解释：通过pushView跳转firsView->secondView->thirdView，当在thirdView执行下面语句，则调回firtView
        //        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
