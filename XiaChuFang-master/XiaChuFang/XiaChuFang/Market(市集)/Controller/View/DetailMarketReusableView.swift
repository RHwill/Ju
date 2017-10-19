//
//  DetailMarketReusableView.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/27.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

protocol DetailMarketReusableViewDelegate: class {
    func detailMarketReusableViewSelectedWithStr(titleStr: String)
}

class DetailMarketReusableView: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegate: DetailMarketReusableViewDelegate?
    
    var detailCollectionView: UICollectionView!
    var collectionArray: NSMutableArray?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionArray = NSMutableArray.init(array: ["水果", "猪牛羊肉", "水产海鲜", "家禽蛋类", "蔬菜"])
        
        self.layoutUIs()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionArray?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPathIndexPath) -> UICollectionViewCell {
        
        let cell: DetailMarketHeaderCell = detailCollectionView.dequeueReusableCellWithReuseIdentifier("DetailMarketHeaderCellIdentifier", forIndexPath: indexPath as IndexPath) as! DetailMarketHeaderCell

        let titleStr = collectionArray?.object(at: indexPath.row)
        cell.titleLable.text = titleStr as? String
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 2
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {

        let titleStr: String = collectionArray?.object(at: indexPath.row) as! String
        
        if let _delegate = delegate {
            _delegate.detailMarketReusableViewSelectedWithStr(titleStr: titleStr)
        }
    }
    
    
    func layoutUIs() {
        // 定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        // 设置cell的大小
        layout.itemSize = CGSize(width: 70, height: 70)
        // 滑动方向，默认方向是垂直方向
        layout.scrollDirection = .horizontal
        // 每个Item之间最小间距
        layout.minimumInteritemSpacing = 10
        // 每行之间最小间距
        layout.minimumLineSpacing = 10
        // 上下左右边距
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10)
        
        detailCollectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:SCREENWIDTH, height:self.frame.size.height), collectionViewLayout: layout)
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        detailCollectionView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
        detailCollectionView.register(UINib(nibName: "DetailMarketHeaderCell", bundle: nil), forCellWithReuseIdentifier: "DetailMarketHeaderCellIdentifier")
        detailCollectionView.showsHorizontalScrollIndicator = false
        self.addSubview(detailCollectionView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    
    
}
