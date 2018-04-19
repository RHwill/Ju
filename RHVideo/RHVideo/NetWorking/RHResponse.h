//
//  RHResponse.h
//  RHVideo
//
//  Created by 蔡荣辉 on 2018/4/19.
//  Copyright © 2018年 蔡荣辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHResponse : NSObject

/** 错误 */
@property (nonatomic, strong) NSError *error;

/** 错误提示 */
@property (nonatomic, copy) NSString *errorMsg;

/** 错误码 */
//@property (assign, nonatomic) NSInteger statusCode;

/** 响应头 */
//@property (nonatomic, copy) NSMutableDictionary *headers;

/** 响应体 */
@property (nonatomic, strong) id responseObject;


@end
