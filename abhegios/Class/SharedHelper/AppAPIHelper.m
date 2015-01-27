//
//  AppAPIHelper.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppAPIHelper.h"
#import "HttpApplyAPI.h"
#import "HttpUserAPI.h"
@implementation AppAPIHelper
HELPER_SHARED

-(id<UserAPI>) getUserAPI
{
    return [[HttpUserAPI alloc] init];
}

-(id<ApplyAPI>) getApplyAPI
{
    return [[HttpApplyAPI alloc] init];
}
@end
