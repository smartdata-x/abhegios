//
//  HttpApplyAPI.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpApplyAPI.h"
#import "GroupInfo.h"
#import "AppInfo.h"
#import "GameHomeInfo.h"
#import "AppDetailsInfo.h"
@implementation HttpApplyAPI
-(void) getAppDetails:(NSInteger)appID delegate:(id<ReqeustDelegate>)delegate
{
     static NSString *path = @"/store/1/summary.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(appID) forKey:@"appid"] delegate:delegate entityClass:[AppDetailsPage class]];
}

-(void) getAppStoreHome:(id<ReqeustDelegate>)delegate
{
    static NSString *path = @"/find/1/appstore.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"appstorehome" groupsData:data entityClass:[AppInfo class]];
    }];
}

-(void) getGameStoreHome:(id<ReqeustDelegate>)delegate
{
    static NSString *path = @"/find/1/gamestore.fcgi";
    [self request:path delegate:delegate entityClass:[GameHomeInfo class]];
}

-(void) getSpecialTopics:(NSInteger) tID delegate:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/store/1/topics.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(tID) forKey:@"tid"] delegate:delegate processBlock:^id(id data) {
        return [AppInfo initWithsDictionarys:[data objectForKey:@"topics"]];
    }];
}

-(void) getWanted:(NSInteger) appID delegate:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/store/1/wanted.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObjectsAndKeys:@(appID),@"appid",@"1",@"machine", nil] delegate:delegate processBlock:^id(id data) {
        NSString *url =  [[data objectForKey:@"basic"] objectForKey:@"url"];
         NSLog(@"%@",url);
         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        return url;
    }];

}

-(void) getAppPersonal:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/find/1/personal.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(1) forKey:@"category"] delegate:delegate processBlock:^id(id data) {
        return [AppInfo initWithsDictionarys:[data objectForKey:@"app"]];
    }];
}

-(void) getGamePersonal:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/find/1/personal.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(2) forKey:@"category"] delegate:delegate processBlock:^id(id data) {
        return [AppInfo initWithsDictionarys:[data objectForKey:@"app"]];
    }];
}

-(void) shake:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/store/1/shark.fcgi";
    [self request:path parameter:nil delegate:delegate processBlock:^id(id data) {
        return [AppInfo initWithsDictionarys:[data objectForKey:@"list"]];
    }];
}

@end
