//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "UserHelper.h"
#import "WBLogin.h"
#import "QQLogin.h"
#import "WXLogin.h"


@implementation UserHelper {

}
HELPER_SHARED

-(void) login:(LoginType) source delegate:(id<LoginDelegate>) delegate{
    static ILogin *login = nil;
    switch (source)
    {
       case LoginTypeWeibo:
           login =  [[WBLogin alloc] init:source];
            break;
       case LoginTypeWX:
           login =  [[WXLogin alloc] init:source];
            break;
       case LoginTypeQQ:
           login = [[QQLogin alloc] init:source];
            break;
        default:
            break;
    }
    [login setDelegate:delegate];
    [login login];
}

@end