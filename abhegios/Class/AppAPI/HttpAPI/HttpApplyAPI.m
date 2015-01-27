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
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(appID) forKey:@""] delegate:delegate entityClass:[AppDetailsInfo class]];
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

@end
