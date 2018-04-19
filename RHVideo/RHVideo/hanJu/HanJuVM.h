//
//  HanJuVM.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HanJuVM : NSObject

- (void)hanJuAllDataSource:(void(^)(NSArray *dataSource))dataSource error:(void(^)(NSError *error))error;

@end
