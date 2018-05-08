//
//  UIView+RH.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "UIView+RH.h"
#import <MBProgressHUD.h>

@implementation UIView (RH)

- (UIView *)rh_addRounderCornerWithRadius:(CGFloat)radius size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(cxt, [UIColor clearColor].CGColor);
    CGContextSetStrokeColorWithColor(cxt, [UIColor clearColor].CGColor);
    
    CGContextMoveToPoint(cxt, size.width, size.height-radius);
    CGContextAddArcToPoint(cxt, size.width, size.height, size.width-radius, size.height, radius);//右下角
    CGContextAddArcToPoint(cxt, 0, size.height, 0, size.height-radius, radius);//左下角
    CGContextAddArcToPoint(cxt, 0, 0, radius, 0, radius);//左上角
    CGContextAddArcToPoint(cxt, size.width, 0, size.width, radius, radius);//右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imageView setImage:image];
    [self addSubview:imageView];
    return imageView;
}

- (void)rh_showText:(NSString *)text {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeText;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:2.0];
}

- (void)rh_showLoadingText:(NSString *)text {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.label.text = text;
    [hud showAnimated:YES];
}

- (void)rh_shadowColor:(UIColor *)color offset:(CGSize)offset opacity:(float)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor; //shadowColor阴影颜色
    self.layer.shadowOffset = offset;  // shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = opacity; // 阴影透明度，默认0
    self.layer.shadowRadius = radius; // 阴影半径，默认3
}

@end
