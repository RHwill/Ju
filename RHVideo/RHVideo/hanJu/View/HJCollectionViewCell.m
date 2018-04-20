//
//  HJCollectionViewCell.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/18.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HJCollectionViewCell.h"
#import "HanJuModel.h"
#import "UIImageView+RH.h"
#import "UIView+RH.h"
#import <Masonry.h>

@implementation HJCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setModel:(HanJuModel *)model {
    if (model.isFinished) {
        _countLabel.text = [NSString stringWithFormat:@"%d集全", model.count];
    }else {
        _countLabel.text = [NSString stringWithFormat:@"更新到%d集", model.count];
    }
    _rankLabel.text = [NSString stringWithFormat:@"%.1f", model.rank / 10.0];
    _nameLabel.text = model.name;
    [_photoImageView imageWithURL:model.thumb radius:4.0];
}

- (void)setupViews {
    _photoImageView = [UIImageView new];
    [self.contentView addSubview:_photoImageView];
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView).offset(0);
        make.bottom.mas_equalTo(self.contentView).inset(25);
    }];

    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 25 - 25, self.frame.size.width, 25)];
    [self.contentView addSubview:backgroundView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0.0 alpha:0.6].CGColor, (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.1].CGColor, (__bridge id)[UIColor clearColor].CGColor];
    gradientLayer.locations = @[@0.1, @0.7, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 1.0);
    gradientLayer.endPoint = CGPointMake(0.05, 0);
    gradientLayer.frame = backgroundView.bounds;
    gradientLayer.cornerRadius = 4.0;
    gradientLayer.masksToBounds = YES;
    [backgroundView.layer addSublayer:gradientLayer];
    
    _rankLabel = [UILabel new];
    _rankLabel.text = @"";
    _rankLabel.textColor = [UIColor orangeColor];
    _rankLabel.font = [UIFont boldSystemFontOfSize:14.0];
    [self.contentView addSubview:_rankLabel];
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.photoImageView).offset(- 2);
    }];
    
    _countLabel = [UILabel new];
    _countLabel.textColor = [UIColor whiteColor];
    _countLabel.font = [UIFont boldSystemFontOfSize:14.0];
    _countLabel.text = @"";
    [self.contentView addSubview:_countLabel];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.photoImageView).offset(2);
        make.bottom.mas_equalTo(self.photoImageView).offset(- 2);
    }];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:13];
    _nameLabel.text = @"";
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(self.contentView);
    }];
}

@end
