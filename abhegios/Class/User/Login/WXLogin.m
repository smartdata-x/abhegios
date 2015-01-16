//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "WXLogin.h"
#import "WXApi.h"


@implementation WXLogin {

}

-(BOOL) handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];
}

-(NSString*) getKey
{
    return kWXAppID;
}

@end