//
//  AppAPIHelper.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppAPIHelper.h"
#import "HttpApplyAPI.h"
#import "HttpOtherAPI.h"
#import "HttpUserAPI.h"
#import "HttpBookAPI.h"
#include "RequestInfo.h"
@implementation AppAPIHelper
HELPER_SHARED
 -(RequestInfo*) getRequestInfo
{
    static RequestInfo *requestInfo = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        requestInfo = [[RequestInfo alloc] init];
    });
    [requestInfo setUid:10009];
    [requestInfo setToken:@""];
    return requestInfo;
}

-(id<UserAPI>) getUserAPI
{
    return [[HttpUserAPI alloc] initWithRequest:[self getRequestInfo]];
}

-(id<ApplyAPI>) getApplyAPI
{
    return [[HttpApplyAPI alloc] initWithRequest:[self getRequestInfo]];
}

-(id<OtherAPI>) getOtherAPI
{
    return [[HttpOtherAPI alloc] initWithRequest:[self getRequestInfo]];

}

-(id<BookAPI>) getBookAPI
{
    return [[HttpBookAPI alloc] initWithRequest:[self getRequestInfo]];
}
@end
