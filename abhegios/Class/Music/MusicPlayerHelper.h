//
//  MusicPlayerHelper.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperProtocol.h"
#import "ReqeustDelegate.h"
#import "MusicList.h"
#import "MusicPlayer.h"

#define PlayerInstance [MusicPlayerHelper shared]

@interface MusicPlayerHelper : NSObject<HelperProtocol, ReqeustDelegate>
@property (nonatomic, retain) MusicList *musicList;
@property (nonatomic, retain) MusicPlayer *musicPlayer;
@property (nonatomic, retain) NSString *dimension;
@property (nonatomic, assign) NSInteger sid;

- (BOOL)isPlaying;
- (void)doNext;
- (void)doStop;
- (void)doPlay;

- (void)setMusicParams:(NSString *)dimension Sid:(NSInteger)sid;
- (void)refreshMusicList;
- (void)setData:(NSArray *)musiclist;
- (MusicRoomInfo *)getCurrentMusicInfo;
@end
