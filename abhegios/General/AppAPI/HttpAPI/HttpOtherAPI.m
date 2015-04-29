//
//  HttpOtherAPI.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpOtherAPI.h"
#import "GroupInfo.h"
#import "BeaconShakeInfo.h"
@implementation HttpOtherAPI
-(void) getRecommendHome:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/find/1/main.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"recommendhome" groupsData:data];
    }];
}

-(void) shakeBeacon:(NSString*) uuid mac:(NSString*) mac delegate:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/beacon/1/shark.fcgi";
    NSDictionary *parameter = [[NSDictionary alloc] initWithObjectsAndKeys:uuid,@"uuid",mac,@"mac", nil];
    [self request:path parameter:parameter delegate:delegate processBlock:^id(id data) {
        data = [data objectForKey:@"info"];
        if ( data != nil)
            return [BeaconShakeInfo initWithDictionary:data];
        else{
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"没有找到信息！" forKey:NSLocalizedDescriptionKey];
            return [NSError errorWithDomain:@"com.http.api" code:-1  userInfo:userInfo];

        }
    }];
}
@end
