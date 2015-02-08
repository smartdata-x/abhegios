//
//  MusicPlayer.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

#define USE_AVPLAYER 1

typedef NS_ENUM(NSInteger, HighLevelPlayerStatus) {
    HighLevelPlayerStatusNone = 0,
    HighLevelPlayerStatusFinished,
};

@protocol HighLevelMusicPlayerDelegate <NSObject>
- (void)didPlayingCurrentMusicFinished;
@end

@interface HighLevelMusicPlayer : NSObject
#if USE_AVPLAYER
#else
<
AudioPlayerDelegate
>
#endif
{
#if USE_AVPLAYER
    AVPlayer *_audioPlayer;
    AVPlayerItem *_audioPlayerItem;
#else
    AudioPlayer *_audioPlayer;
#endif
}
@property (nonatomic, retain) id<HighLevelMusicPlayerDelegate> delegate;
- (void)playWithStrUrl:(NSString *)strurl;
- (BOOL)isPlaying;
- (void)doPlay;
- (void)doPause;
- (void)doStop;
- (CGFloat)getDuration;
- (CGFloat)getPlayProgress;
@end
