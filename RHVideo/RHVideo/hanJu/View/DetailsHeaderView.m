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
    backgroundImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundImageViewClick)];
    [backgroundImageView addGestureRecognizer:tap];
    [self addSubview:backgroundImageView];
    
    UIImageView *imageView = [UIImageView new];
    [backgroundImageView addSubview:imageView];
    [imageView imageWithURL:self.dataModel.thumb radius:4.0];
    [imageView rh_shadowColor:[UIColor blackColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:2];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(15);
        make.bottom.mas_equalTo(self).offset(-15);
        make.width.mas_equalTo(100);
    }];
    
    HJStarView *starView = [[HJStarView alloc] initWithPoint:CGPointMake(100 + 10 + 15, 25) star:self.dataModel.rank];
    [self addSubview:starView];
    
    UILabel *countLabel = [UILabel new];
    countLabel.textColor = [UIColor whiteColor];
    countLabel.font = [UIFont systemFontOfSize:14];
    if (self.dataModel.isFinished) {
        countLabel.text = [NSString stringWithFormat:@"%d集全", self.dataModel.count];
    }else {
        countLabel.text = [NSString stringWithFormat:@"更新到%d集", self.dataModel.count];
    }
    [countLabel rh_shadowColor:[UIColor grayColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:2];
    [self addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).offset(15);
        make.top.mas_equalTo(starView.mas_bottom).offset(15);
        make.width.mas_equalTo(100);
    }];
    
    UILabel *fromLabel = [UILabel new];
    fromLabel.textColor = [UIColor whiteColor];
    fromLabel.font = [UIFont systemFontOfSize:14];
    fromLabel.text = [NSString stringWithFormat:@"来源：%@", self.dataModel.source];
    [fromLabel rh_shadowColor:[UIColor grayColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:2];
    [self addSubview:fromLabel];
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countLabel.mas_left);
        make.top.mas_equalTo(countLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(150);
    }];
    
    UIButton *setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:setButton];
    [setButton setTitle:[NSString stringWithFormat:@"▶ 第%@集", @(1)] forState:UIControlStateNormal];
    setButton.backgroundColor = [UIColor brownColor];
    [setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    setButton.layer.cornerRadius = 5.0;
    [setButton addTarget:self action:@selector(setButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [setButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(fromLabel.mas_left);
        make.top.mas_equalTo(fromLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(95);
        make.height.mas_equalTo(35);
    }];
    
    UIButton *cacheButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cacheButton];
    [cacheButton setTitle:@"♨ 缓存" forState:UIControlStateNormal];
    cacheButton.backgroundColor = [UIColor brownColor];
    cacheButton.layer.cornerRadius = 5.0;
    [cacheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cacheButton addTarget:self action:@selector(cacheButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cacheButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(setButton.mas_right).offset(15);
        make.top.mas_equalTo(setButton.mas_top);
        make.width.mas_equalTo(setButton.mas_width);
        make.height.mas_equalTo(setButton.mas_height);
    }];
    
    UILabel *nextLabel = [UILabel new];
    nextLabel.textColor = [UIColor whiteColor];
    nextLabel.font = [UIFont boldSystemFontOfSize:15.0];
    nextLabel.text = @">";
    [self addSubview:nextLabel];
    [nextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(- 15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.height.mas_equalTo(30);
    }];
}

- (void)backgroundImageViewClick {
    [self didSelectDelegate:DetailsHeaderViewSelectBackground];
}

- (void)setButtonClick {
    [self didSelectDelegate:DetailsHeaderViewSelectSetButton];
}

- (void)cacheButtonClick {
    [self didSelectDelegate:DetailsHeaderViewSelectCacheButton];
}

- (void)didSelectDelegate:(DetailsHeaderViewSelectType)type {
    if ([self.delegate respondsToSelector:@selector(detailsHeaderView:didSelectedIndex:)]) {
        [self.delegate detailsHeaderView:self didSelectedIndex:type];
    }
}

@end
