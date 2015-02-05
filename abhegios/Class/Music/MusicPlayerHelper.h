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
#import "HighLevelMusicPlayer.h"

typedef NS_ENUM(NSInteger, MusicPlayerHelperState) {
    MusicPlayerHelperStatePlay = 0,
    MusicPlayerHelperStatePause,
    MusicPlayerHelperStateStop,
    MusicPlayerHelperStateNext,
    MusicPlayerHelperStateError,
};

@protocol MusicPlayerHelperDelegate <NSObject>
- (void)MusicPlayerHelperStateChange:(NSInteger)state;
@end

#define PlayerInstance [MusicPlayerHelper shared]

@interface MusicPlayerHelper : NSObject<HelperProtocol, ReqeustDelegate, HighLevelMusicPlayerDelegate>
@property (nonatomic, retain) id<MusicPlayerHelperDelegate> delegate;
@property (nonatomic, retain) MusicList *musicList;
@property (nonatomic, retain) HighLevelMusicPlayer *musicPlayer;
@property (nonatomic, retain) NSString *dimension;
@property (nonatomic, assign) NSInteger sid;

- (void)playWithStrUrl:(NSString *)strurl;
- (BOOL)isPlaying;
- (void)doNext;
- (void)doStop;
- (void)doPlayOrPause;

- (void)setMusicParams:(NSString *)dimension Sid:(NSInteger)sid;
- (void)refreshMusicList;
- (void)updateViewProgress:(id)view;
- (void)setData:(NSArray *)musiclist;
- (MusicRoomInfo *)getCurrentMusicInfo;
@end
