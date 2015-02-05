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

@interface MusicRoomViewController ()
//@property (nonatomic, retain) MusicPlayerHelper *playerHelper;
@end

@implementation MusicRoomViewController
{
    NSTimer *_frameTimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PlayerInstance.delegate = self;
    if (_frameTimer == nil) {
        _frameTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(updateScreenPerFrame) userInfo:nil repeats:YES];
        [_frameTimer fire];
    }
    [PlayerInstance refreshMusicList];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)updateScreen {
    MusicRoomInfo *currentInfo = [PlayerInstance getCurrentMusicInfo];
    NSString *nameArtist = [NSString stringWithFormat:@"%@ - %@", currentInfo.name, currentInfo.artist];
    [_name setText:nameArtist];
    [_viewStyle1 setData:currentInfo];
}

- (void)updateScreenPerFrame {
    [PlayerInstance updateViewProgress:_viewStyle1];
}

- (IBAction)doNext:(id)sender {
    [PlayerInstance doNext];
    [self updateScreen];
}

- (IBAction)doTrash:(id)sender {
    [self.navigationController pushViewControllerWithIdentifier:@"MusicFMTableViewController" completion:^(UIViewController *viewController) {
    } animated:YES];
}

- (IBAction)doLove:(id)sender {
    
}

- (void)MusicPlayerHelperStateChange:(NSInteger)state {
    if (state == MusicPlayerHelperStateNext) {
        [self updateScreen];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
