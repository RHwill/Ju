//
//  HJStarView.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/5/7.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "HJStarView.h"
#import "UIView+RH.h"

@interface HJStarView ()

@property (nonatomic) CGFloat star;
@property (nonatomic, strong) UIImage *sizeImage;
@end

@implementation HJStarView

- (instancetype)initWithPoint:(CGPoint)point star:(CGFloat)star {
    if (self = [super init]) {
        self.frame = CGRectMake(point.x, point.y, self.sizeImage.size.width * 5 + 15 + 25, self.sizeImage.size.height);
        self.star = star;
//        self.backgroundColor = [UIColor redColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    UILabel *rankLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 25, 0, 25, self.frame.size.height)];
    rankLabel.textColor = [UIColor orangeColor];
    rankLabel.textAlignment = NSTextAlignmentRight;
    rankLabel.text = [NSString stringWithFormat:@"%.1f", self.star / 10];
    [rankLabel rh_shadowColor:[UIColor orangeColor] offset:CGSizeMake(0.8, 1) opacity:0.8 radius:0.3];
    [self addSubview:rankLabel];
    
    self.star /= 20.0;
    for (int i = 0; i < 5; i++) {
        UIImageView *normalImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.sizeImage.size.width, 0, self.sizeImage.size.width, self.sizeImage.size.height)];
        normalImageView.image = [UIImage imageNamed:@"detail_empty_star"];
        normalImageView.tag = 100083 + i;
        [self addSubview:normalImageView];
    }
    
    NSString *starStr = [NSString stringWithFormat:@"%.1f", self.star];
    NSArray *starArr = [starStr componentsSeparatedByString:@"."];
    
    for (int i = 0; i < [starArr.firstObject intValue]; i++) {
        UIImageView *selectedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.sizeImage.size.width, 0, self.sizeImage.size.width, self.sizeImage.size.height)];
        selectedImageView.image = [UIImage imageNamed:@"detail_all_star"];
        [self addSubview:selectedImageView];
    }
    UIImage *halfImage = [UIImage imageNamed:@"detail_half_star"];
    if (![starArr.lastObject isEqualToString:@"0"]) {
        [[self viewWithTag:100083 + [starArr.firstObject intValue]] setHidden:YES];
        UIImageView *halfImageView = [[UIImageView alloc] initWithFrame:CGRectMake([starArr.firstObject intValue] * self.sizeImage.size.width, 0, halfImage.size.width, halfImage.size.height)];
        halfImageView.image = halfImage;
        [self addSubview:halfImageView];
    }
    
}

- (UIImage *)sizeImage {
    if (!_sizeImage) {
        _sizeImage = [UIImage imageNamed:@"detail_empty_star"];
    }
    return _sizeImage;
}

@end
