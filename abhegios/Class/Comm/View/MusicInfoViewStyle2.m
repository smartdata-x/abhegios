//
//  MusicInfoViewStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicInfoViewStyle2.h"

@implementation MusicInfoViewStyle2
{
    NSTimer *timer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [_viewStyle1 awakeFromNib];
    [self updateScreen];
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updatePerFrame) userInfo:nil repeats:YES];
        [timer fire];
    }
}

- (void)setData:(id)data {
    [_viewStyle1 setData:nil];
}

- (void)updateScreen {
    [_viewStyle1 setData:[PlayerInstance getCurrentMusicInfo]];
}

- (void)updatePerFrame {
    [PlayerInstance updateViewProgress:_viewStyle1];
}

- (void)MusicPlayerHelperStateChange:(NSInteger)state {
    [self updateScreen];
}

@end
