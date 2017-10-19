//
//  LJPlacePickerView.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/22.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

protocol LJPlacePickerViewDelegate: class {
    func dismissPickerViewAction(button: UIButton!,  provinceStr: String?, cityStr: String?, townStr: String?)
}

class LJPlacePickerView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    weak var delegate: LJPlacePickerViewDelegate?
    
    var placePicker: UIPickerView!
    var placePickerArray: Array<Any>!
    var provinceArray: Array<Any>!
    var cityArray: Array<Any>!
    var townArray:Array<String>!
    var selectedArray: Array<Any>!
    
    var provinceStr: String?
    var cityStr: String?
    var townStr: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.provinceArray = Array()
        self.cityArray = Array()
        self.townArray = Array()
        
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.layoutPlacePickerView()
        self.getPlacePickerData()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutPlacePickerView() {
        
        let placeBackView: UIView = UIView.init(frame: CGRect(x:0, y:self.frame.size.height-300, width:SCREENWIDTH, height:300))
        placeBackView.backgroundColor = XCFColor(r: 242, g: 242, b: 242)
        self.addSubview(placeBackView)
        
        let cancleButton: UIButton = UIButton.init(frame: CGRect(x:15, y:0, width:40, height:40))
        cancleButton.setTitle("取消", for: UIControlState.normal)
        cancleButton.setTitleColor(XCFColor(r: 102, g: 102, b: 102), for: UIControlState.normal)
        cancleButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cancleButton.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside)
        placeBackView.addSubview(cancleButton)
        
        let titleLable: UILabel = UILabel.init(frame: CGRect(x:70, y:5, width:SCREENWIDTH-130, height:30))
        titleLable.text = "选择城市"
        titleLable.font = UIFont.systemFont(ofSize: 13)
        titleLable.textAlignment = NSTextAlignment.center
        placeBackView.addSubview(titleLable)
        
        let button: UIButton = UIButton.init(frame: CGRect(x:SCREENWIDTH-50, y:0, width:40, height:40))
        button.setTitle("完成", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside)
        placeBackView.addSubview(button)
        
        self.placePicker = UIPickerView.init(frame: CGRect(x:0, y:40, width:SCREENWIDTH, height:260))
        self.placePicker.delegate = self
        self.placePicker.dataSource = self
        self.placePicker.backgroundColor = UIColor.white
        self.placePicker.showsSelectionIndicator = true // 显示选中框
        //        self.placePicker.autoresizingMask = UIViewAutoresizing.FlexibleHeight |UIViewAutoresizing.FlexibleWidth //这里设置了就可以自定                                                                                                                           义高度了，一般默认是无法修改其216像素的高度
        placeBackView.addSubview(self.placePicker)
        
    }
    
    @objc func btnAction(sender: UIButton) {
        self.removeFromSuperview()
        
        if let _delaget = delegate {
            print("省份为：\(String(describing: provinceStr))")
            _delaget.dismissPickerViewAction(button: sender, provinceStr: self.provinceStr, cityStr: self.cityStr, townStr: self.townStr)
        }
    }
    
    // MARK: - UIPickerView Delagete
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return (self.provinceArray?.count)!
        } else if component == 1 {
            return (self.cityArray?.count)!
        } else {
            return (self.townArray?.count)!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            let provinceDic:Dictionary = Dictionary.init(dictionary: (self.provinceArray!.objectAtIndex(row) as? Dictionary)!)
            self.provinceStr = provinceDic.object(forKey: provinceDic.allKeys[1]) as? String
            print("row ====\(row)  省份为：\(String(describing: provinceStr))")
            return self.provinceStr
        } else if component == 1 {
            let cityDic:Dictionary = Dictionary.init(dictionary: (self.cityArray!.objectAtIndex(row))!)
            self.cityStr = cityDic.object(forKey: cityDic.allKeys[1]) as? String
            return cityStr
        } else {
            self.townStr = self.townArray!.objectAtIndex(row)
            return self.townStr
        }
    }
    
    // 最重要的部分，实现didSelectRow()方法刷新内容，实现三级联动。类似的算法跟上面大同小异，只是调用了pickerView.reload方法，刷新component完成联动。
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            let provinceDic:Dictionary = Dictionary.init(dictionary: (self.provinceArray!.objectAtIndex(row))!)
            self.provinceStr = provinceDic.object(forKey: provinceDic.allKeys[1]) as? String
            print("row ====\(row)  省份为：\(String(describing: provinceStr))")
            self.selectedArray = provinceDic.object(forKey: provinceDic.allKeys[0]) as! Array<Any>
            if self.selectedArray!.count > 0 {
                self.cityArray = self.selectedArray
            } else {
                self.cityArray = nil
            }
            if self.cityArray!.count > 0 {
                let townDic: Dictionary = Dictionary.init(dictionary: self.cityArray?.objectAtIndex(0))
                self.townArray = townDic.objectForKey(townDic.allKeys[0]) as! Array<String>
            } else {
                self.townArray = nil
            }
        }
        pickerView.selectedRow(inComponent: 1)
        pickerView.reloadComponent(1)
        pickerView.selectedRow(inComponent: 2)
        
        if component == 1 {
            if self.selectedArray!.count > 0 && self.cityArray!.count > 0 {
                let townDic: Dictionary = Dictionary.init(dictionary: self.cityArray?.object(at: row))
                self.townArray = townDic.object(forKey: townDic.allKeys[0])
            } else {
                self.townArray = nil
            }
            pickerView.selectRow(1, inComponent: 2, animated: true)
        }
        
        pickerView.reloadComponent(2)
    }
    
    // MARK: - 获取省市区字典数据源
    func getPlacePickerData() {
        self.placePickerArray = Array()
        let path: String = Bundle.main.path(forResource: "area.plist", ofType:nil)!
        self.placePickerArray = Array(contentsOfFile: path)
        self.provinceArray = self.placePickerArray
        self.selectedArray = self.provinceArray
        
        if self.selectedArray?.count > 0 {
            let cityDic: NSDictionary = NSDictionary.init(dictionary: self.selectedArray?.object(at: 0) as! NSDictionary)
            self.cityArray = cityDic.object(forKey: cityDic.allKeys[0])
        }
        
        if self.cityArray?.count > 0 {
            let townDic: NSDictionary = NSDictionary.init(dictionary: self.cityArray?.object(at: 0) as! NSDictionary)
            self.townArray = townDic.object(forKey: townDic.allKeys[0]) as! Array<String>
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
