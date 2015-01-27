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
#include "RequestInfo.h"
@implementation AppAPIHelper
HELPER_SHARED
 -(RequestInfo*) getRequestInfo
{
    RequestInfo*  requestInfo = [[RequestInfo alloc] init];
    [requestInfo setUid:0];
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
@end
