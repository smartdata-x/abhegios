//
//  MusicInfoViewStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/4.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicInfoViewStyle2.h"
#import "AppAPIHelper.h"

@implementation MusicInfoViewStyle2
{
    NSTimer *timer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [_viewStyle1 setFrame:CGRectMake(20, 0, 50, 50)];
    [_viewStyle1 updateRadius];
    [self updateScreen];
    [self doNext];
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updatePerFrame) userInfo:nil repeats:YES];
        [timer fire];
    }
}

- (void)setData:(id)data {
    [_viewStyle1 setData:nil];
}

- (void)doNext {
    // donothing but init
    [_love setBackgroundImage:[UIImage imageNamed:@"love_icon.png"] forState:UIControlStateNormal];
}

- (void)doTrash {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    [[[AppAPIHelper shared] getMusicAPI] hateSong:currentInfo.id delegate:nil];
}

- (void)doLove {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    if (currentInfo.like) {
        [[[AppAPIHelper shared] getMusicAPI] deleteCltSong:currentInfo.id delegate:self];
    }
    else {
        [[[AppAPIHelper shared] getMusicAPI] collectSong:currentInfo.id tid:PlayerInstance.sid dimension:PlayerInstance.dimension delegate:self];
    }
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    NSString *resultStr = (NSString *)data;
    NSString *likeImg = @"love_icon.png";
    if ([resultStr isEqualToString:REQUEST_COLLECTSONG]) {
        likeImg = @"love_on.png";
    }
    else if ([resultStr isEqualToString:REQUEST_DELETESONG]) {
        
    }
    [_love setBackgroundImage:[UIImage imageNamed:likeImg] forState:UIControlStateNormal];
    currentInfo.like = !currentInfo.like;
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    
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
