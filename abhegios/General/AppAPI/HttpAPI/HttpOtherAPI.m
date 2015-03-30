//
//  HttpOtherAPI.m
//  abhegios
//
//  Created by 180 on 15/1/27.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpOtherAPI.h"
#import "GroupInfo.h"
@implementation HttpOtherAPI
-(void) getRecommendHome:(id<ReqeustDelegate>) delegate
{
    static NSString *path = @"/find/1/main.fcgi";
    [self request:path delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"recommendhome" groupsData:data];
    }];
}
@end
