//
//  RHNetworking.m
//  RHVideo
//
//  Created by lipsCai on 2018/4/19.
//  Copyright © 2018年 lipsCai. All rights reserved.
//

#import "RHNetworking.h"
#import <AFNetworking.h>

@interface RHNetworking ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation RHNetworking

+ (instancetype)manager {
    static RHNetworking *rhNetworking;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rhNetworking = [[self alloc] init];
    });
    return rhNetworking;
}

- (void)GET:(NSString *)URLString headers:(NSDictionary *)headers parameters:(NSDictionary *)parmeters finishBlock:(void(^)(RHResponse *response))finishBlock {
    [self httpMethod:@"GET" URLString:URLString headers:headers parameters:parmeters finishBlock:finishBlock];
}

- (void)POST:(NSString *)URLString headers:(NSDictionary *)headers parameters:(NSDictionary *)parmeters finishBlock:(void(^)(RHResponse *response))finishBlock {
    [self httpMethod:@"POST" URLString:URLString headers:headers parameters:parmeters finishBlock:finishBlock];
}

- (void)httpMethod:(NSString *)httpMethod
         URLString:(NSString *)URLString
           headers:(NSDictionary *)headers
        parameters:(NSDictionary *)parmeters
       finishBlock:(void(^)(RHResponse *response))finishBlock {
    
    if (headers.count > 0) {
        for (NSString *key in headers.allKeys) {
            [self.manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    if ([httpMethod isEqualToString:@"GET"]) {
        [self.manager GET:URLString parameters:parmeters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finishBlock([self responseSuccess:responseObject]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finishBlock([self responseError:error]);
        }];
    }else if ([httpMethod isEqualToString:@"POST"]) {
        [self.manager GET:URLString parameters:parmeters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finishBlock([self responseSuccess:responseObject]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finishBlock([self responseError:error]);
        }];
    }
}

- (RHResponse *)responseSuccess:(id)objcect {
    RHResponse *response = [RHResponse new];
    response.responseObject = objcect;
    return response;
}

- (RHResponse *)responseError:(NSError *)error {
    RHResponse *response = [RHResponse new];
    response.error = error;
    return response;
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = (AFHTTPResponseSerializer *)[AFJSONResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", nil];
    }
    return _manager;
}


@end
