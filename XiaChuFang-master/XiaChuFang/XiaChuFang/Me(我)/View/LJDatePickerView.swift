//
//  LJDatePickerView.swift
//  XiaChuFang
//
//  Created by 罗金 on 16/6/22.
//  Copyright © 2016年 EasyFlower. All rights reserved.
//

import UIKit

protocol LJDatePickerViewDelegate: class {
    func LJDatePickerViewFinishAction(sender: UIButton, dateStr: String)
}

class LJDatePickerView: UIView {
    
    weak var delegate: LJDatePickerViewDelegate?

    var beginTime :  String?
    var endTime   :  String?
    
    var datePicker: UIDatePicker?
    
    var minDate: Date?
    var maxDate: Date?
    var dateFormat: DateFormatter = DateFormatter()
    
    var selectedDate: Date?
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        
         // 时间显示格式
        dateFormat.dateStyle = DateFormatter.Style.long
        dateFormat.dateFormat = "yyyy-MM-dd"
        //            dateFormat.timeStyle = NSDateFormatterStyle.LongStyle
        
        self.createDatePicker()
    }
    
    func createDatePicker() {
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
        titleLable.text = "选择出生日期"
        titleLable.font = UIFont.systemFont(ofSize: 13)
        titleLable.textAlignment = NSTextAlignment.center
        placeBackView.addSubview(titleLable)
        
        let button: UIButton = UIButton.init(frame: CGRect(x:SCREENWIDTH-50, y:0, width:40, height:40))
        button.setTitle("完成", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside)
        placeBackView.addSubview(button)

        
        self.datePicker = UIDatePicker(frame: CGRect(x:0, y:40, width:SCREENWIDTH, height:260))
        // 将日期选择器区域设置为中文，则选择器日期显示为中文
        self.datePicker?.locale = Locale(identifier: "zh_CN")
        
        // 日期模式，默认年月日时分秒 设置后为年月日
        self.datePicker?.datePickerMode = UIDatePickerMode.date
        
        // 设置最大最小时间
        let maxDate = dateFormat.date(from: "2016-06-25")
        let minDate = dateFormat.date(from: "1980-01-01")
        self.datePicker!.maximumDate = maxDate
        self.datePicker!.minimumDate = minDate        // 设置默认时间        
        self.datePicker!.date = Date()
        
        self.selectedDate = self.datePicker?.date
    
        self.datePicker?.addTarget(self, action: #selector(dateChanged), for: UIControlEvents.valueChanged)
        
       
        placeBackView.addSubview(self.datePicker!)
    }
    

    
    @objc func btnAction(sender: UIButton) {
        self.removeFromSuperview()
        if let _delaget = delegate {
            _delaget.LJDatePickerViewFinishAction(sender: sender, dateStr: dateFormat.string(from: self.selectedDate!))
        }
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        // 更新提醒时间文本框
        let formatter = DateFormatter()
        // 日期样式
        formatter.dateFormat = "yyyy-MM-dd"
        print(formatter.string(from: datePicker.date))
        self.selectedDate = datePicker.date
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
