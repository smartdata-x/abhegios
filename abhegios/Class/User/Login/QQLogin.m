//
// Created by 180 on 15/1/16.
// Copyright (c) 2015 180. All rights reserved.
//

#import "QQLogin.h"
#import "TencentOAuth.h"


@implementation QQLogin {

}


-(BOOL) handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

-(NSString*) getKey
{
    return [NSString stringWithFormat:@"tencent%@",kQQAppID];
}

@end