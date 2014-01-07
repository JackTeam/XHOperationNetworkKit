//
//  XHOperationNetworkKit.h
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-2.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^XHHTTPProgressHandler)(CGFloat progress, unsigned long long total);
typedef void (^XHJSONSuccessHandler)(id json);
typedef void (^XHHTTPSuccessHandler)(NSData *responseData, NSURLResponse *response);
typedef void (^XHHTTPFailureHandler)(NSData *responseData, NSURLResponse *response, NSError *error);

@interface XHOperationNetworkKit : NSOperation

+ (NSOperationQueue *)queue;

- (id)initWithRequest:(NSURLRequest *)request;
- (id)initWithRequest:(NSURLRequest *)request
   jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
       failureHandler:(XHHTTPFailureHandler)failureHandler;
- (id)initWithRequest:(NSURLRequest *)request
       successHandler:(XHHTTPSuccessHandler)successHandler
       failureHandler:(XHHTTPFailureHandler)failureHandler;


- (void)setSuccessHandler:(XHHTTPSuccessHandler)successHandler;
- (void)setFailureHandler:(XHHTTPFailureHandler)failureHandler;
- (void)setProgressHandler:(XHHTTPProgressHandler)progressHandler;

@end
