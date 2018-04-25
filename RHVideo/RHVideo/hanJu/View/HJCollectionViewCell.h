//
//  HJCollectionViewCell.h
//  RHVideo
//
//  Created by lipsCai on 2018/4/18.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HanJuModel;
@interface HJCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *photoImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *rankLabel;

@property (nonatomic, strong) UILabel *countLabel;

- (void)setModel:(HanJuModel *)model;

@end
