//
//  MusicPlayerHelper.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicPlayerHelper.h"

@implementation MusicPlayerHelper
{
    MusicList *_musicList;
    MusicPlayer *_musicPlayer;
}

- (BOOL)isPlaying {
    return [_musicPlayer isPlaying];
}

- (void)doNext {
    if (![_musicList isListEmpty]) {
        [_musicList getNextMusicInfo];
        [_musicPlayer doPlay];
    }
}

- (void)doPlay {
    [_musicPlayer doPlay];
}

- (void)doStop {
    [_musicPlayer doStop];
}
@end
