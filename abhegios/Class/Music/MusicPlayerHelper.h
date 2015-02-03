//
//  MusicPlayerHelper.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"
#import "MusicList.h"
#import "MusicPlayer.h"
@interface MusicPlayerHelper : NSObject<HelperProtocol>
- (BOOL)isPlaying;
- (void)doNext;
- (void)doStop;
- (void)doPlay;

- (void)setData:(NSArray *)musiclist;
- (MusicRoomInfo *)getCurrentMusicInfo;
@end
