//
//  Network.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/15.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import Alamofire

class Network: NSObject {
    
    static let manager = Network();
    
    fileprivate override init() {
        
    }
    
    func requestGetData(URLString:String, successBlcok:@escaping (_ response:Any) -> Void, failureBlock:@escaping (_ error:Error) -> Void) {
        Alamofire.request(URLString).responseJSON { (returnResult) in
            switch returnResult.result {
            case .success(let value):
                successBlcok(value as AnyObject)
            case .failure(let error):
                failureBlock(error)
            }
        }
    }
}
