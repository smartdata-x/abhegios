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

-(void) login:(Login_Source) source delegate:(id<LoginDelegate>) delegate{
    ILogin *login = nil;
    switch (source)
    {
       case WeiboLogin_Source:
           login =  [[WBLogin alloc] init:source];
            break;
       case WXLogin_Source:
           login =  [[WXLogin alloc] init:source];
            break;
       case QQLogin_Source:
           login = [[QQLogin alloc] init:source];
            break;
        default:
            break;
    }
    [login setDelegate:delegate];
    [login login];
}

@end