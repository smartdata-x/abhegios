//
//  MusicRoomViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicRoomViewController.h"
#import "GroupInfo.h"
#import "AppAPIHelper.h"
#import "MusicInfoViewStyle3.h"
#import "MusicFMInfo.h"

@interface MusicRoomViewController ()
//@property (nonatomic, retain) MusicPlayerHelper *playerHelper;
@end

@implementation MusicRoomViewController
{
    NSTimer *_frameTimer;
    NSArray *_fmInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBar];
    if (_frameTimer == nil) {
        _frameTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateScreenPerFrame) userInfo:nil repeats:YES];
        [_frameTimer fire];
    }
    [PlayerInstance refreshMusicList];
    _fmInfo = [GroupInfo initWithsConfigAndDataJsonFile:@"musicfm" jsonName:@"musicfm" entityClass:[MusicFMInfo class]];
}

- (void)viewDidAppear:(BOOL)animated {
    PlayerInstance.delegate = self;
    _viewStyle1.delegate = self;
    // 再次进入时刷新一次
    [self updateScreen];
    [_viewStyle1 updateRadius];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
}

- (void)initNavBar {
    MusicInfoViewStyle3 *viewStyle3 = [MusicInfoViewStyle3 loadFromNib];
    [viewStyle3 setData:@"发现音乐" Right:@"我的FM" LeftMajor:YES];
    [viewStyle3.rightButton addTarget:self action:@selector(gotoMusicFMView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = viewStyle3;
}

- (void)updateScreen {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    NSString *nameArtist = [NSString stringWithFormat:@"%@ - %@", currentInfo.name, currentInfo.artist];
    [_name setText:nameArtist];
    [_viewStyle1 setData:currentInfo];

    NSArray *loc = [MusicFMInfo getLocationFromGroupinfo:_fmInfo Dimension:[PlayerInstance dimension] Sid:[PlayerInstance sid]];
    NSInteger musicDimension = [[loc objectAtIndex:0] integerValue];
    NSInteger musicSid = [[loc objectAtIndex:1] integerValue];
    NSString *summary = [[[[_fmInfo objectAtIndex:musicDimension] entitys] objectAtIndex:musicSid] strSid];
    [_summary setText:summary];
    
    // like
    NSString *isLike = currentInfo.like ? @"love_on.png" : @"love_icon.png";
    [_love setBackgroundImage:[UIImage imageNamed:isLike] forState:UIControlStateNormal];
}

- (void)updateScreenPerFrame {
    [PlayerInstance updateViewProgress:_viewStyle1];
}

- (IBAction)doNext:(id)sender {
    [PlayerInstance doNext];
}

- (IBAction)doTrash:(id)sender {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    [[[AppAPIHelper shared] getMusicAPI] hateSong:currentInfo.id delegate:nil];
}

- (IBAction)doLove:(id)sender {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    NSString *likeImg = @"love_icon.png";
    if (currentInfo.like) {
        [[[AppAPIHelper shared] getMusicAPI] deleteCltSong:currentInfo.id delegate:nil];
    }
    else {
        [[[AppAPIHelper shared] getMusicAPI] collectSong:currentInfo.id delegate:nil];
        likeImg = @"love_on.png";
    }
    [_love setBackgroundImage:[UIImage imageNamed:likeImg] forState:UIControlStateNormal];
    currentInfo.like = !currentInfo.like;
}

- (void)gotoMusicFMView {
    [self.navigationController pushViewControllerWithIdentifier:@"MusicFMViewController" completion:^(UIViewController *viewController) {
    } animated:YES];
}

- (void)MusicPlayerHelperStateChange:(NSInteger)state {
    if (state == MusicPlayerHelperStateNext) {
        [self updateScreen];
    }
}

- (void)MusicInfoViewStyle1Clicked {
    [PlayerInstance doPlayOrPause];
    [_viewStyle1 pauseTimer:![PlayerInstance isPlaying]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setData:(id) data
{
    
}

@end
