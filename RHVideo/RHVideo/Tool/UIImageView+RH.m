//
//  UIImageView+RH.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "UIImageView+RH.h"
#import "UIImage+RoundedCorner.h"
#import <UIImageView+WebCache.h>
#import "UIImage+ImageEffects.h"

@implementation UIImageView (RH)

- (void)imageWithURL:(NSString *)url radius:(CGFloat)radius {
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [image imageAddCornerWithRadius:radius size:self.frame.size];
        });
    }];
}

- (void)imageLightEffectWithURL:(NSString *)url {
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *newImage = [image rh_imageTargetWidth:[UIScreen mainScreen].bounds.size.width];
            newImage = [newImage rh_imageInRect:CGRectMake(0,  self.frame.size.height / 2, self.frame.size.width / 2.5, self.frame.size.height / 2.5)];
            UIColor *tintColor = [UIColor colorWithWhite:0.5 alpha:0.1];
            self.image = [newImage applyBlurWithRadius:5 tintColor:tintColor saturationDeltaFactor:1.3 maskImage:nil];
            
        });
    }];
}

@end
