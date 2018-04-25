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

@implementation UIImageView (RH)

- (void)imageWithURL:(NSString *)url radius:(CGFloat)radius {
    [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [image imageAddCornerWithRadius:radius size:self.frame.size];
        });
    }];
}

@end
