//
//  MusicPlayer.h
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@protocol HighLevelMusicPlayerDelegate <NSObject>
- (void)didPlayingCurrentMusicFinished;
@end

@interface HighLevelMusicPlayer : NSObject<AudioPlayerDelegate>
{
    AudioPlayer *_audioPlayer;
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
