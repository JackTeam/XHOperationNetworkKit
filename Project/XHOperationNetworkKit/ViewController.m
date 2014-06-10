//
//  ViewController.m
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-2.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "ViewController.h"
#import "XHOperationNetworkKit.h"
#import "XHHTTPClient.h"

static NSString *const RedditTopStoriesURLString = @"http://www.reddit.com/top.json";

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (void)_registerToServer {
    [XHHTTPClient POSTPath:@"/jack/XHSocial/register.php" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"gaga121ff1", @"username", @"1234561", @"password", @"example1@QQ.com", @"email", nil] jsonSuccessHandler:^(id json) {
        /*
         // 用户相关的
         define('USERNAME_IS_NULL', '40020');
         define('PASSWORLD_IS_NULL', '40021');
         define('EMAIL_IS_NULL', '40022');
         
         // 注册的
         define('UERNAME_IS_ALREADY_IN_USE', '40023');
         define('EMAIL_IS_ALREADY_IN_USE', '40024');
         define('REGISTER_SUECCEED', '40025');
         */
        NSLog(@"json : %@", json);
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        NSLog(@"error : %@", error);
    }];
}


- (void)_loginToServer {
    [XHHTTPClient GETPath:@"/jack/XHSocial/login.php" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"gaga", @"username", @"123456", @"password", nil] jsonSuccessHandler:^(id json) {
        /*
         // 登录的
         define('LOGIN_SEUCCEED', '50020');
         define('LOGIN_FIELD', '50030');
         */
        NSLog(@"json : %@", json);
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        NSLog(@"error : %@", error);
    }];
}

- (void)_getJSONWithRedditTopStories {
    NSURL *url = [NSURL URLWithString:RedditTopStoriesURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    XHOperationNetworkKit *operation = [[XHOperationNetworkKit alloc] initWithRequest:request jsonSuccessHandler:^(id json) {
        NSLog(@"json : %@", json);
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        NSLog(@"Failed to get top stories");
    }];
    [operation setProgressHandler:^(CGFloat progress, unsigned long long total) {
        NSLog(@"progress : %f,  total : %f", progress, (float)total);
    }];
    [operation startRequest];
}

- (void)_getRedditTopStories
{
    NSURL *url = [NSURL URLWithString:RedditTopStoriesURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    XHOperationNetworkKit *operation = [[XHOperationNetworkKit alloc] initWithRequest:request successHandler:^(NSData *responseData, NSURLResponse *response) {
        
        NSError *parseError;
        NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&parseError];
        NSAssert(!parseError, @"Failed to parse responseData");
        
        NSLog(@"Top Stories: %@", JSON[@"data"][@"children"]);
        
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        
        NSLog(@"Failed to get top stories");
        
    }];
    
    [self.queue addOperation:operation];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self _getJSONWithRedditTopStories];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
