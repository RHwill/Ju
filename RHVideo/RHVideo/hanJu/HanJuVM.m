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

@implementation HanJuVM

- (NSString *)URL:(NSString *)url {
    NSString *baseURL = @"http://api.hanju.koudaibaobao.com/api/series/";
    baseURL = [baseURL stringByAppendingString:url];
    return baseURL;
}

- (void)hanJuAllDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error {
    NSString *url = [self URL:[NSString stringWithFormat:@"indexV2?_ts=%.f&count=60&offset=0", ([[NSDate date] timeIntervalSince1970] * 1000)]];
    [[RHNetworking manager] GET:url parameters:nil finishBlock:^(RHResponse *response) {
        if (response.error) {
            error(response.error);
            return;
        }
        if ([response.responseObject[@"rescode"] integerValue] == 0) {
            NSArray *moveArr = response.responseObject[@"seriesList"];
            NSMutableArray *mutableArr = [NSMutableArray array];
            for (NSDictionary *dict in moveArr) {
                HanJuModel *hjModel = [HanJuModel yy_modelWithJSON:dict];
                [mutableArr addObject:hjModel];
            }
            dataSource(mutableArr.copy);
        }else {
            error(response.error);
        }
    }];
}

@end
