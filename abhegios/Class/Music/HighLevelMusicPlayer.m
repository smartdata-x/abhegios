//
//  MusicPlayer.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HighLevelMusicPlayer.h"

@implementation HighLevelMusicPlayer

- (id)init {
    self = [super init];
    if (self) {
        _audioPlayer = [[AudioPlayer alloc] init];
        _audioPlayer.delegate = self;
    }
    return self;
}

- (void)playWithStrUrl:(NSString *)strurl {
    if (strurl) {
        [_audioPlayer play:[NSURL URLWithString:strurl]];
    }
}

- (CGFloat)getDuration {
    if (_audioPlayer && _audioPlayer.duration > 0) {
        return _audioPlayer.duration;
    }
    return 0.001f;
}

- (CGFloat) getPlayProgress {
    if (_audioPlayer && _audioPlayer.progress > 0 && _audioPlayer.duration > 0) {
        return _audioPlayer.progress / _audioPlayer.duration;
    }
    return 0.001f;
}

- (BOOL)isPlaying {
    return _audioPlayer.state == AudioPlayerStatePlaying;
}

- (void)doPlay {
    [_audioPlayer resume];
}

- (void)doPause {
    [_audioPlayer pause];
}

- (void)doStop {
    [_audioPlayer stop];
}

#pragma mark - delegate
- (void)audioPlayer:(AudioPlayer *)audioPlayer stateChanged:(AudioPlayerState)state {
    
}

- (void)audioPlayer:(AudioPlayer *)audioPlayer didEncounterError:(AudioPlayerErrorCode)errorCode {
    
}

- (void)audioPlayer:(AudioPlayer *)audioPlayer didStartPlayingQueueItemId:(NSObject *)queueItemId {
    
}

- (void)audioPlayer:(AudioPlayer *)audioPlayer didFinishPlayingQueueItemId:(NSObject *)queueItemId withReason:(AudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration {
    if ([_delegate respondsToSelector:@selector(didPlayingCurrentMusicFinished)]) {
        [_delegate didPlayingCurrentMusicFinished];
    }
}

- (void)audioPlayer:(AudioPlayer *)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject *)queueItemId {
    
}

- (void)audioPlayer:(AudioPlayer *)audioPlayer didCancelQueuedItems:(NSArray *)queuedItems {
    
}
@end
