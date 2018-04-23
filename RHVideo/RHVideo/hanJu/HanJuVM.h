//
//  HanJuVM.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HanJuVM : NSObject

- (void)hj_loadDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error;

- (void)hj_loadMoreDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error;

@end
