//
//  HighLevelMoviePlayerView.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/28.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "HighLevelMoviePlayerView.h"

@implementation HighLevelMoviePlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] setPlayer:player];
}

@end
