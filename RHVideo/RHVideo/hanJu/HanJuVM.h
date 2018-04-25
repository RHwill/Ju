//
//  HanJuVM.h
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HanJuModel;
@interface HanJuVM : NSObject

- (void)hj_loadDataSource:(void(^)(NSArray <HanJuModel *> *dataArr))dataSource error:(void(^)(NSError *error))error;

- (void)hj_loadMoreDataSource:(void(^)(NSArray <HanJuModel *> *dataArr))dataSource error:(void(^)(NSError *error))error;

@end
