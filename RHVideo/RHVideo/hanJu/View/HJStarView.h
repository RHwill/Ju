//
//  HJStarView.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/5/7.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJStarView : UIView

/**
 初始化

 @param frame 坐标
 @param star 星级 评分按最大 100 分
 @return HJStarView
 */
- (instancetype)initWithPoint:(CGPoint)point star:(CGFloat)star;

@end
