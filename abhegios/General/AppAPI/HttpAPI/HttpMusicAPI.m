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

- (void)getMusicClt:(NSInteger)tid delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/music/1/getcltsongs.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(tid) forKey:@"tid"] delegate:delegate processBlock:^id(id data) {
        return [GroupInfo initWithsConfigAndDataDictionarys:@"musicroom" groupsData:data entityClass:[MusicRoomInfo class]];
    }];
}

- (void)collectSong:(NSInteger)sid tid:(NSInteger)tid dimension:(NSString *)dimension delegate:(id<ReqeustDelegate>)delegate {
    NSString *path = @"/music/1/collectsong.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@(sid), @(tid), dimension, nil] forKeys:[NSArray arrayWithObjects:@"songid", @"sid", @"dimension", nil]] delegate:delegate processBlock:^id(id data) {
        return REQUEST_COLLECTSONG;
    }];
}

- (void)deleteCltSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/music/1/delcltsong.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(sid) forKey:@"songid"] delegate:delegate processBlock:^id(id data) {
        return REQUEST_DELETESONG;
    }];
}

- (void)hateSong:(NSInteger)sid delegate:(id<ReqeustDelegate>)delegate {
    static NSString *path = @"/music/1/hatesong.fcgi";
    [self request:path parameter:[NSDictionary dictionaryWithObject:@(sid) forKey:@"songid"] delegate:delegate processBlock:^id(id data) {
        return nil;
    }];
}
@end
