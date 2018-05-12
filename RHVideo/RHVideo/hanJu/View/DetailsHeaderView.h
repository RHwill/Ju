//
//  DetailsHeaderView.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/5/7.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DetailsHeaderViewSelectType) {
    DetailsHeaderViewSelectBackground,
    DetailsHeaderViewSelectSetButton,
    DetailsHeaderViewSelectCacheButton,
};

@class DetailsHeaderView;
@protocol DetailsHeaderViewDelegate <NSObject>

- (void)detailsHeaderView:(DetailsHeaderView *)headerView didSelectedIndex:(DetailsHeaderViewSelectType)index;

@end

@class HanJuModel;
@interface DetailsHeaderView : UIView

@property (nonatomic, weak) id<DetailsHeaderViewDelegate>delegate;

@property (nonatomic) int readCount;

- (instancetype)initWithFrame:(CGRect)frame model:(HanJuModel *)model;

@end
