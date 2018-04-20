//
//  HanJuVM.m
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import "HanJuVM.h"
#import "RHNetworking.h"
#import "HanJuModel.h"
#import <YYModel.h>
#import <YYCache.h>

@interface HanJuVM ()

@property (nonatomic, strong) YYCache *hanJuCache;

@end

@implementation HanJuVM

- (NSString *)URL:(NSString *)url {
    NSString *baseURL = @"http://api.hanju.koudaibaobao.com/api/series/";
    baseURL = [baseURL stringByAppendingString:url];
    return baseURL;
}

- (void)hanJuAllDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error {
    NSString *url = [self URL:[NSString stringWithFormat:@"indexV2?_ts=%.f&count=60&offset=0", ([[NSDate date] timeIntervalSince1970] * 1000)]];
    NSDictionary *dict = @{@"vc" : @"i_3700",
                           @"vn" : @"i_3.7",
                           @"app" : @"hj",
                           @"sign" : @"ZUf16kseWmv5OIZOgZN9HUZVHoOFjXx5mAR3n4ipNWXE1XOJNJK7fAi22RN7Pq71mDIa9gzYVX4qUll1QLUQlyU/TlyhSfS8rGxT6Higanv0EaEJZ/P4K0aQtWiS5KDB6V8zvwXpELMqHuPmhh4E3ySTrisifOXHAa4a08QgvblEQwug2fROrSZpHv4cJMPJqzk4KwXKDD91vDILHO29HZc5GIYvQ2/KPVZKqU162begrfeJYdub+o4ebvQTjFcsk/v5lc/0U98Nc4Q4HVMVodzKUi9jnEw1D8jAb/VCb0Q7oVTlz5VPPElzkND2cHUsxFRrRTinEIZhk5lFBtgUfIJ8sjxRlv9zTlPRvVJk3ADsl+W9L4KxqLPTREvxIhqVIlJ6Qz209G5Yv7LNRgHP1WYCdIS6vaCgEW19cDqy2ug=",
                           @"uk" : @"2zooyDg1nDJsRXmy4eyip9ejNS+a1T5/B2TppUUuiqY="};
    [[RHNetworking manager] GET:url headers:dict parameters:nil finishBlock:^(RHResponse *response) {
        if (response.error) {
            dataSource([self addSeriesList]);
            error(response.error);
            return;
        }
        if ([response.responseObject[@"rescode"] integerValue] == 0) {
            NSArray *moveArr = response.responseObject[@"seriesList"];
            if (moveArr.count > 0) {
                [self.hanJuCache setObject:moveArr forKey:@"seriesList" withBlock:^{}];
                NSArray *listArr = [self addSeriesList:moveArr];
                dataSource(listArr);
                return;
            }
            dataSource([self addSeriesList]);
            return;
        }
        dataSource([self addSeriesList]);
        error(response.error);
        return;
    }];
}

- (NSArray *)addSeriesList {
    return [self addSeriesList:nil];
}

- (NSArray *)addSeriesList:(NSArray *)listArr {
    if (listArr.count > 0) {
        return [self addHanJuModel:listArr];
    }
    if ([self.hanJuCache containsObjectForKey:@"seriesList"]) {
        id seriesList = [self.hanJuCache objectForKey:@"seriesList"];
        return [self addHanJuModel:seriesList];
    }
    return @[];
}

- (NSArray *)addHanJuModel:(NSArray *)arr {
    NSMutableArray *mutableArr = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        HanJuModel *hjModel = [HanJuModel yy_modelWithJSON:dict];
        [mutableArr addObject:hjModel];
    }
    return mutableArr.copy;
}

#pragma mark - GET
- (YYCache *)hanJuCache {
    if (!_hanJuCache) {
        _hanJuCache = [YYCache cacheWithName:@"com.lips"];
    }
    return _hanJuCache;
}

@end
