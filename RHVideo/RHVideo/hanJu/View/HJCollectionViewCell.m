//
//  HJCollectionViewCell.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/18.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HJCollectionViewCell.h"
#import "UIImage+RoundedCorner.h"
#import <UIImageView+AFNetworking.h>
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

- (void)setupViews {
    _photoImageView = [UIImageView new];
    [self.contentView addSubview:_photoImageView];
    [_photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.contentView).offset(0);
        make.bottom.mas_equalTo(self.contentView).inset(25);
    }];
    _photoImageView.backgroundColor = [UIColor greenColor];
    
    
    _rankLabel = [UILabel new];
    _rankLabel.text = @"9.0";
    _rankLabel.textColor = [UIColor orangeColor];
    _rankLabel.font = [UIFont systemFontOfSize:13.0];
    [self.contentView addSubview:_rankLabel];
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.photoImageView).offset(- 2);
    }];
    
    _countLabel = [UILabel new];
    _countLabel.textColor = [UIColor whiteColor];
    _countLabel.font = [UIFont systemFontOfSize:13.0];
    _countLabel.text = @"更新到第6集";
    [self.contentView addSubview:_countLabel];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.photoImageView).offset(2);
        make.bottom.mas_equalTo(self.photoImageView).offset(- 2);
    }];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:13];
    _nameLabel.text = @"经常请吃饭的漂亮姐姐";
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.width.mas_equalTo(self.contentView);
    }];
}

@end
