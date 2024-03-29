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
#import "MusicInfoViewStyle1.h"
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
        instance.musicPlayer = [[HighLevelMusicPlayer alloc] init];
        instance.musicPlayer.delegate = instance;
        instance.helperState = -1;
        instance.dimension = @"chl";
        instance.sid = 1;
    });
    return sharedHelper;
}

- (void)refreshMusicList {
    // 如果列表不为空，则不需要刷新列表
    if (![_musicList isListHaveNext]) {
        [[[AppAPIHelper shared] getMusicAPI] getMusicDimension:self Dimension:_dimension Sid:_sid];
    }
}

- (void)setMusicParams:(NSString *)dimension Sid:(NSInteger)sid ForceReload:(BOOL)reload {
    _dimension = dimension;
    _sid = sid;
    if (reload) {
        [_musicList cleanList];
        [self refreshMusicList];
    }
}

- (void)setMusicClt:(NSInteger)tid ForceReload:(BOOL)reload {
    [_musicList cleanList];
    [[[AppAPIHelper shared] getMusicAPI] getMusicClt:tid delegate:self];
}

- (void)updateViewProgress:(id)view {
    MusicInfoViewStyle1 *viewStyle1 = (MusicInfoViewStyle1 *)view;
    [viewStyle1 updateProcessLine:[_musicPlayer getPlayProgress]];
}

- (void)playWithStrUrl:(NSString *)strurl {
    [_musicPlayer playWithStrUrl:strurl];
}

- (BOOL)isPlaying {
    return [_musicPlayer isPlaying];
}

- (void)doNext {
    MusicRoomInfo *nextMusicInfo = [_musicList getNextMusicInfo];
    if (nextMusicInfo) {
        [self playWithStrUrl:nextMusicInfo.url];
        [self MusicHelperStateChange:MusicPlayerHelperStateNext];
    }
    else {
        [self refreshMusicList];
    }
}

- (void)doPlayOrPause {
    if ([self isPlaying]) {
        [_musicPlayer doPause];
    }
    else {
        [_musicPlayer doPlay];
    }
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
    // 载入完成，主动开始下一首歌的播放
    [self didPlayingCurrentMusicFinished];
}

- (void)didPlayingCurrentMusicFinished {
    [self doNext];
    [self MusicHelperStateChange:MusicPlayerHelperStateNext];
}

- (void)MusicHelperStateChange:(MusicPlayerHelperState )changedState {
    _helperState = changedState;
    if ([_delegate respondsToSelector:@selector(MusicPlayerHelperStateChange:)]) {
        [_delegate MusicPlayerHelperStateChange:_helperState];
    }
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    [self setData:[[data objectAtIndex:0] entitys]];
    [self performSelector:@selector(finishLoadData) withObject:nil afterDelay:0.25];
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    NSLog(@"%@", err);
}

@end
