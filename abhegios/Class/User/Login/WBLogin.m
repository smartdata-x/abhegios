//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "WBLogin.h"
#import "WeiboSDK.h"


@implementation WBLogin {

}

-(NSString*) getKey
{
    return [NSString stringWithFormat:@"wb%@",kWeiboAppID];
}
-(BOOL) handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}
@end