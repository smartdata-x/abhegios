//
//  HttpUserAPI.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpUserAPI.h"
#import "UserInfo.h"
#import "ThirdLoginInfo.h"
@implementation HttpUserAPI
-(void) thirdLogin:(ThirdLoginInfo *)loginInfo delegate:(id<ReqeustDelegate>)delegate
{
    static NSString *path = @"/user/1/thirdlogin.fcgi";
    NSLog(@"%@",loginInfo);
    [self request:path parameter:[loginInfo toDictionary:NO] delegate:delegate processBlock:^id(id data) {
        return [UserInfo initWithDictionary:[data objectForKey:@"userinfo"]];
    }];
}
@end
