//
//  XHOperationNetworkKit.h
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-2.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^XHHTTPSuccessHandler)(NSData *responseData, NSURLResponse *response);
typedef void (^XHHTTPFailureHandler)(NSData *responseData, NSURLResponse *response, NSError *error);

@interface XHOperationNetworkKit : NSOperation

@property (nonatomic, copy) NSURLRequest *request;

- (id)initWithRequest:(NSURLRequest *)request;

- (id)initWithRequest:(NSURLRequest *)request
       successHandler:(XHHTTPSuccessHandler)successHandler
       failureHandler:(XHHTTPFailureHandler)failureHandler;

- (void)setSuccessHandler:(XHHTTPSuccessHandler)successHandler;

- (void)setFailureHandler:(XHHTTPFailureHandler)failureHandler;

@end
