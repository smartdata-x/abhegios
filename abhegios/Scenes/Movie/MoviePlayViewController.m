//
//  MoviePlayViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MoviePlayViewController.h"

@interface MoviePlayViewController ()

@end

@implementation MoviePlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPlayer];
}

- (void)initPlayer {
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://v.jxvdy.com/sendfile/X9rkoogzpPTI67LTWNmRjx_E5wY1JiNL31b4bzwwLEJk1aTGk471ZyuIve3_7pl7b7BorRtqiaa4dh8JNXoeTc0a1ZHnHw"]];
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [playerItem addObserver:self forKeyPath:@"loadedTimeRange" options:NSKeyValueObservingOptionNew context:nil];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
    
    // 保存player
    [_moviePlayerView setPlayer:player];
    [_moviePlayerView.player play];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            // 视频可以开始播放了
        }
        else if ([playerItem status] == AVPlayerStatusFailed) {
            
        }
    }
    else if ([keyPath isEqualToString:@"loadedTimeRange"]) {
        // 视频缓冲的进度
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)moviePlayDidEnd:(id)sender
{
    
}
- (IBAction)doPlayOrPause:(id)sender
{
    
}

@end
