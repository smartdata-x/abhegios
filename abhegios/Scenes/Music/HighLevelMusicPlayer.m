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
#if USE_AVPLAYER
        // 控制后台播放
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        // 获取播放事件
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishedPlaying) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
#else
        _audioPlayer = [[AudioPlayer alloc] init];
        _audioPlayer.delegate = self;
#endif
    }
    return self;
}

- (void)playWithStrUrl:(NSString *)strurl {
    if (strurl) {
#if USE_AVPLAYER
        _audioPlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:strurl]];
        if (_audioPlayer) {
            [_audioPlayer play];
        }
#else
        [_audioPlayer play:[NSURL URLWithString:strurl]];
#endif
    }
}

- (CGFloat)getDuration {
#if USE_AVPLAYER
    if (_audioPlayer) {
        CMTime duration = _audioPlayer.currentItem.asset.duration;
        if (duration.timescale <= 0.001f) {
            return 0.001f;
        }
        return duration.value / duration.timescale;
    }
#else
    if (_audioPlayer && _audioPlayer.duration > 0) {
        return _audioPlayer.duration;
    }
#endif
    return 0.001f;
}

- (CGFloat) getPlayProgress {
#if USE_AVPLAYER
    if (_audioPlayer) {
        CGFloat duration = [self getDuration];
        if (_audioPlayer.currentTime.timescale <= 0.001f) {
            return 0.001f;
        }
        CGFloat currentTime = _audioPlayer.currentTime.value / _audioPlayer.currentTime.timescale;
        CGFloat progress = currentTime / duration;
        progress = progress <= 0.01 ? 0.01 : progress;
        return progress;
    }
#else
    if (_audioPlayer && _audioPlayer.progress > 0 && _audioPlayer.duration > 0) {
        return _audioPlayer.progress / _audioPlayer.duration;
    }
#endif
    return 0.001f;
}

- (BOOL)isPlaying {
#if USE_AVPLAYER
    return _audioPlayer.rate > 0.0;
#else
    return _audioPlayer.state == AudioPlayerStatePlaying;
#endif
}

- (void)doPlay {
#if USE_AVPLAYER
    [_audioPlayer play];
#else
    [_audioPlayer resume];
#endif
}

- (void)doPause {
#if USE_AVPLAYER
    [_audioPlayer pause];
#else
    [_audioPlayer pause];
#endif
}

- (void)doStop {
#if USE_AVPLAYER
#else
    [_audioPlayer stop];
#endif
}

#if USE_AVPLAYER

- (void)finishedPlaying {
    if ([_delegate respondsToSelector:@selector(didPlayingCurrentMusicFinished)]) {
        [_delegate didPlayingCurrentMusicFinished];
    }
}
#else
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
#endif

@end
