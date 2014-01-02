//
//  ViewController.m
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-2.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "ViewController.h"
#import "XHOperationNetworkKit.h"

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

- (void)_getJSONWithRedditTopStories {
    NSURL *url = [NSURL URLWithString:RedditTopStoriesURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    XHOperationNetworkKit *operation = [[XHOperationNetworkKit alloc] initWithRequest:request jsonSuccessHandler:^(id json, NSURLResponse *response) {
        NSLog(@"json : %@", json);
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        NSLog(@"Failed to get top stories");
    }];
    [operation setProgressHandler:^(CGFloat progress, unsigned long long total) {
        NSLog(@"progress : %f,  total : %f", progress, (float)total);
    }];
    [self.queue addOperation:operation];
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
