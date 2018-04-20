//
//  RHNetworking.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RHResponse.h"

@interface RHNetworking : NSObject

+ (instancetype)manager;

- (void)GET:(NSString *)URLString headers:(NSDictionary *)headers parameters:(NSDictionary *)parmeters finishBlock:(void(^)(RHResponse *response))finishBlock;
- (void)POST:(NSString *)URLString headers:(NSDictionary *)headers parameters:(NSDictionary *)parmeters finishBlock:(void(^)(RHResponse *response))finishBlock;

@end
