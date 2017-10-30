//
//  ViewModel.swift
//  NewApp
//
//  Created by 蔡荣辉 on 2017/10/23.
//  Copyright © 2017年 蔡荣辉. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewModel: NSObject {

    static let manager = ViewModel()

    fileprivate override init() {}
    
    func newNews(URLString:String!, finishBlock:@escaping (Array<Model>) -> Void) {
        Network.manager.GETData(URLString: url_qdaily, successBlcok: { (returnResult) in
            
            let newsData = self.jsonAddModel(returnResult: returnResult)
            
            DispatchQueue.main.async {
                finishBlock(newsData)
            }
        }, failureBlock: { (error) in
            finishBlock([])
        })
    }
    
    func moreNews(URLString: String!, finishBlock:@escaping (Array<Model>) -> Void) {
        Network.manager.GETData(URLString: url_qdaily_more, successBlcok: { (response) in
            
            let moreNewsArr = self.jsonAddModel(returnResult: response)
            
            DispatchQueue.main.async {
                finishBlock(moreNewsArr)
            }
        }) { (error) in
            finishBlock([])
        }
    }
    
    fileprivate func jsonAddModel(returnResult: Any) -> [Model] {
        
        let info = JSON(returnResult as Any)
        let banner = info["response"]["feeds"]
        
        var modelArr = Array<Model>()
        for (_, subJSON) in banner {
            let banners = subJSON["post"]
            
            let modelData = Model()
            var url = banners["appview"].stringValue
            
            if url.isEmpty {
                url = url_jianshu
            }
            modelData.url = url
            
            let title = banners["title"].stringValue
            modelData.title = title
            
            var image = banners["image"].stringValue
            if image.isEmpty {
                image = url_defImage
            }
            modelData.image = image
            
            modelArr.append(modelData)
        }
        
        return modelArr
    }
}
