//
//  HttpMusicAPI.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HttpMusicAPI.h"
#import "GroupInfo.h"
#import "MusicRoomInfo.h"

@implementation HttpMusicAPI
- (void)getMusicDimension:(id<ReqeustDelegate>)delegate Dimension:(NSString *)dimension Sid:(NSInteger)sid {
    static NSString *path = @"/music/1/getdimension.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:dimension, @(sid), nil] forKeys:[NSArray arrayWithObjects:@"dimension", @"sid", nil]] delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"musicroom" groupsData:data entityClass:[MusicRoomInfo class]];
    }];
}
@end
