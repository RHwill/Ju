//
//  UIImageView+RoundedCorner.h
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundedCorner)

- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius size:(CGSize)size;

- (UIImage *)rh_boxblurWithBlurNumber:(CGFloat)blur;

- (UIImage *)rh_imageInRect:(CGRect)rect;
/// 指定宽度按比例缩放
- (UIImage *)rh_imageTargetWidth:(CGFloat)defineWidth;

@end
