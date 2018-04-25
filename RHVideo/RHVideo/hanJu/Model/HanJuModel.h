//
//  HanJuModel.h
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HanJuModel : NSObject

/// 集数
@property (nonatomic) int count;
/// 是否完集
@property (nonatomic) BOOL isFinished;
/// 剧名
@property (nonatomic, copy) NSString *name;
/// 评分
@property (nonatomic) int rank;

@property (nonatomic, copy) NSString *sid;
/// 资源来自哪
@property (nonatomic, copy) NSString *source;
/// 图片链接
@property (nonatomic, copy) NSString *thumb;

@end
