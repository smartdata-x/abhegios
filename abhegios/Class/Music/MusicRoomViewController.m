//
//  MusicRoomViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicRoomViewController.h"
#import "AppAPIHelper.h"
#import "MusicPlayerHelper.h"
@interface MusicRoomViewController ()
@property (nonatomic, retain) MusicPlayerHelper *playerHelper;
@end

@implementation MusicRoomViewController
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[AppAPIHelper shared] getMusicAPI] getMusicDimension];
    _playerHelper = [[MusicPlayerHelper alloc] init];
}

- (void)finishLoadData {
    [self updateScreen];
}

- (void)updateScreen {
    MusicRoomInfo *currentInfo = [_playerHelper getCurrentMusicInfo];
    NSString *nameArtist = [NSString stringWithFormat:@"%@ - %@", currentInfo.name, currentInfo.artist];
    [_name setText:nameArtist];
}

- (void)updateScreenPerFrame {
    
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    [_playerHelper setData:data];
    [self performSelector:@selector(finishLoadData) withObject:nil afterDelay:0.25];
}

- (void)reqeust:(id)reqeust didError:(NSError *)err {
    NSLog(@"%@", err);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
