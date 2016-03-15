//
//  XHHTTPClient.h
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-4.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHOperationNetworkKit.h"

#define XHHTTPClientTimeoutInterval 30

static NSString *const pailixiuHomeURL = @"http://www.pailixiu.com";

@interface XHHTTPClient : XHOperationNetworkKit

+ (void)GETPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
failureHandler:(XHHTTPFailureHandler)failureHandler;

+ (void)POSTPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
failureHandler:(XHHTTPFailureHandler)failureHandler;

+ (void)DELETEPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
    failureHandler:(XHHTTPFailureHandler)failureHandler;


@end
