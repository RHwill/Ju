//
//  DetailsHeaderView.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/5/7.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "DetailsHeaderView.h"
#import "UIImageView+RH.h"
#import "UIView+RH.h"
#import "HJStarView.h"
#import "HanJuModel.h"
#import <Masonry.h>

@interface DetailsHeaderView ()

@property (nonatomic, strong) HanJuModel *dataModel;

@end

@implementation DetailsHeaderView

- (instancetype)initWithFrame:(CGRect)frame model:(HanJuModel *)model {
    if (self = [super initWithFrame:frame]) {
        NSParameterAssert(model);
        self.dataModel = model;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [backgroundImageView imageLightEffectWithURL:self.dataModel.thumb];
    [self addSubview:backgroundImageView];
    
    UIImageView *imageView = [UIImageView new];
    [backgroundImageView addSubview:imageView];
    [imageView imageWithURL:self.dataModel.thumb radius:4.0];
    [imageView rh_shadowColor:[UIColor blackColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:3];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(15);
        make.bottom.mas_equalTo(self).offset(-15);
        make.width.mas_equalTo(100);
    }];
    
    HJStarView *starView = [[HJStarView alloc] initWithPoint:CGPointMake(100 + 10 + 15, 25) star:self.dataModel.rank];
    [self addSubview:starView];
    
    UILabel *countLabel = [UILabel new];
    [self addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

@end
