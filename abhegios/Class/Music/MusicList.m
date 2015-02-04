//
//  MusicList.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicList.h"

@implementation MusicList
{
    NSInteger musicCount;
    NSInteger currentMusicIndex;
}

- (void)setMusicList:(NSArray *)musiclist {
    if (_musicListArray == nil) {
        _musicListArray = [[NSMutableArray alloc] init];
    }
    [_musicListArray addObjectsFromArray:musiclist];
    musicCount = [_musicListArray count];
}

- (MusicRoomInfo *)getCurrentMusicInfo {
    if (currentMusicIndex < musicCount - 1 && currentMusicIndex >= 0) {
        return [_musicListArray objectAtIndex:currentMusicIndex];
    }
    return nil;
}

- (MusicRoomInfo *)getNextMusicInfo {
    if (currentMusicIndex >= musicCount - 1) {
        return nil;
    }
    currentMusicIndex++;
    return [self getCurrentMusicInfo];
}

- (MusicRoomInfo *)getPrevMusicInfo {
    if (currentMusicIndex < 0) {
        return nil;
    }
    currentMusicIndex--;
    return [self getCurrentMusicInfo];
}

- (BOOL)isListEmpty {
    return musicCount < 0;
}

@end
