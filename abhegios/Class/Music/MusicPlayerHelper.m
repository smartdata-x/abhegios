//
//  MusicPlayerHelper.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicPlayerHelper.h"
#import "GroupInfo.h"
#import "MusicRoomInfo.h"
#import "AppAPIHelper.h"
@implementation MusicPlayerHelper
{
}

+(instancetype)shared{
    static id sharedHelper = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedHelper = [[self alloc] init];
        MusicPlayerHelper *instance = (MusicPlayerHelper *)sharedHelper;
        instance.musicList = [[MusicList alloc] init];
        instance.musicPlayer = [[MusicPlayer alloc] init];
        instance.dimension = @"chl";
        instance.sid = 1;
    });
    return sharedHelper;
}

- (void)refreshMusicList {
    [[[AppAPIHelper shared] getMusicAPI] getMusicDimension:self Dimension:_dimension Sid:_sid];
}

- (void)setMusicParams:(NSString *)dimension Sid:(NSInteger)sid {
    _dimension = dimension;
    _sid = sid;
}

- (BOOL)isPlaying {
    return [_musicPlayer isPlaying];
}

- (void)doNext {
    if (![_musicList isListEmpty]) {
        MusicRoomInfo *nextMusicInfo = [_musicList getNextMusicInfo];
        if (nextMusicInfo == nil) {
            [self refreshMusicList];
        }
        else {
            [_musicPlayer doPlay];
        }
    }
}

- (void)doPlay {
    [_musicPlayer doPlay];
}

- (void)doStop {
    [_musicPlayer doStop];
}

- (MusicRoomInfo *)getCurrentMusicInfo {
    return [_musicList getCurrentMusicInfo];
}

- (void)setData:(NSArray *)musiclist {
    [_musicList setMusicList:musiclist];
}

- (void)finishLoadData {
    
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    [self setData:[[data objectAtIndex:0] entitys]];
    [self performSelector:@selector(finishLoadData) withObject:nil afterDelay:0.25];
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    NSLog(@"%@", err);
}

@end
