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
    [self addSubview:countLabel];
    countLabel.textColor = [UIColor whiteColor];
    if (self.dataModel.isFinished) {
        countLabel.text = [NSString stringWithFormat:@"%d集全", self.dataModel.count];
    }else {
        countLabel.text = [NSString stringWithFormat:@"更新到%d集", self.dataModel.count];
    }
    [countLabel rh_shadowColor:[UIColor grayColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:2];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).offset(15);
        make.top.mas_equalTo(starView.mas_bottom).offset(15);
        make.width.mas_equalTo(100);
    }];
    
    UILabel *fromLabel = [UILabel new];
    [self addSubview:fromLabel];
    fromLabel.textColor = [UIColor whiteColor];
    fromLabel.text = [NSString stringWithFormat:@"来源：%@", self.dataModel.source];
    [fromLabel rh_shadowColor:[UIColor grayColor] offset:CGSizeMake(-0.5, 0) opacity:0.1 radius:2];
    [fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(countLabel.mas_left);
        make.top.mas_equalTo(countLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(150);
    }];
    
    UIButton *setButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:setButton];
    [setButton setTitle:[NSString stringWithFormat:@"▶ 第%@集", @(1)] forState:UIControlStateNormal];
    setButton.backgroundColor = [UIColor purpleColor];
    [setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    setButton.layer.cornerRadius = 5.0;
//    setButton.layer.shouldRasterize = YES;
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
    cacheButton.backgroundColor = [UIColor purpleColor];
    cacheButton.layer.cornerRadius = 5.0;
//    cacheButton.layer.shouldRasterize = YES;
    [cacheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cacheButton addTarget:self action:@selector(cacheButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cacheButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(setButton.mas_right).offset(15);
        make.top.mas_equalTo(setButton.mas_top);
        make.width.mas_equalTo(setButton.mas_width);
        make.height.mas_equalTo(setButton.mas_height);
    }];
}

- (void)setButtonClick {
    NSLog(@"jishu");
}

- (void)cacheButtonClick {
    NSLog(@"huancun");
}

@end
