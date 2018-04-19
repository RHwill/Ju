//
//  UIImageView+RoundedCorner.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "UIImage+RoundedCorner.h"
#import <UIImage+AFNetworking.h>

@implementation UIImage (RoundedCorner)

- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
