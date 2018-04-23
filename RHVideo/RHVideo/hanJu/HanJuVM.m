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

@property (nonatomic, strong) YYCache *hj_cache;

@end

@implementation HanJuVM

- (NSString *)URL:(NSString *)url {
    NSString *baseURL = @"http://api.hanju.koudaibaobao.com/api/series/";
    baseURL = [baseURL stringByAppendingString:url];
    return baseURL;
}

- (void)hj_loadDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error {
    [self hj_loadAllDataSource:0 sign:@"ZUf16kseWmv5OIZOgZN9HfgTpQHrOoayUWtg3qwhJC80dPaoEh6FFPEmB8VDukB6mVcKX75SzDLqtMNb8/yDz0uUKCkmVuX3TWwti1beTZnf8wL+JI42I+I3tfHby8CvCDeXCB/lqiQHhns7TrJoUZG33fuuVYOsLUI2/5CagoOJkydObDI9NiiiszM79uYmbbWx/QT0cekvEkxOCEJAqvg5hugM0H2KX6qKnZiaQJVk7eBBX1JbUsfIXdstjMvvxn21HtKXtxONBLYXDFPxe6ksemX1K5mXvDARKkj0xNJ9xBoUgVYWouFxUp9ZzfTVvxfqEki2QYwgnHpPKb5bd95+y+Il4HwY3co13iY/g6Ihl404z4yIQUvaKse4ApEas41unvZrZ7oCeMRN6P0HNQDJw+h0ccLW2l7dvE8Y/ls=" success:dataSource error:error];
}

- (void)hj_loadMoreDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error {
    [self hj_loadAllDataSource:60 sign:@"REv0bbPu+qyxH/q6wWfe2enwIZluafllVlvMJ8o64gk/o1jHT0WDvQYofb86FmcJyrUCpCWOcdAHb1MUQ9k0Qo5sJwQK9Ff0ijX4ZSeg7+LC/lWCkzbkcOEs3by6hkuS2312fXHnxJ+k8e5yTlpgFrMsBUHaflpK587CjZWfoLsf97GJDYJLEfG/6FnlWRLZYuRWpvQ0vOZGTcZVlftOnS5qcxbqwrltzWhIp00QLkvVI9mbs0b7D+WTZWxeFYuzKlq7fjfymb73Q/m6gDEz5gwDOBPDC4E/29iDZpcziCKRHfApbtrBtECK5v3ZiO2lBHXc+s/KkKz3L6kQHSpR1w==" success:dataSource error:error];
}

- (void)hj_loadAllDataSource:(int)offset sign:(NSString *)sign success:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error {
     NSString *url = [self URL:[NSString stringWithFormat:@"indexV2?_ts=%.f&count=60&offset=%d", ([[NSDate date] timeIntervalSince1970] * 1000), offset]];
    NSDictionary *dict = @{@"vc" : @"i_3700",
                           @"vn" : @"i_3.7",
                           @"app" : @"hj",
                           @"sign" : sign,
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
//                [self.hj_cache ]
                [self.hj_cache setObject:moveArr forKey:@"seriesList" withBlock:^{}];
                NSArray *listArr = [self addSeriesList:moveArr];
                dataSource(listArr);
                return;
            }
            dataSource([self addSeriesList]);
            // 错误处理
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
    if ([self.hj_cache containsObjectForKey:@"seriesList"]) {
        id seriesList = [self.hj_cache objectForKey:@"seriesList"];
        return [self addHanJuModel:seriesList];
    }
    return @[];
}

- (NSArray *)addHanJuModel:(NSArray *)arr {
    NSMutableArray *mutableArr = [NSMutableArray array];
    for (NSDictionary *dict in arr) {
        HanJuModel *hj_model = [HanJuModel yy_modelWithJSON:dict];
        [mutableArr addObject:hj_model];
    }
    return mutableArr.copy;
}

#pragma mark - GET
- (YYCache *)hj_cache {
    if (!_hj_cache) {
        _hj_cache = [YYCache cacheWithName:@"com.lips"];
    }
    return _hj_cache;
}

@end
