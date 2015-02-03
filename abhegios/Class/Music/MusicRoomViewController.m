//
//  MusicRoomViewController.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/3.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicRoomViewController.h"
#import "AppAPIHelper.h"
@interface MusicRoomViewController ()

@end

@implementation MusicRoomViewController
{
    NSArray *_musicListGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //[[[AppAPIHelper shared] getMusicAPI] getMusicDimension];
}

- (void)finishLoadData {
}

- (void)reqeust:(id)reqeust didComplete:(id)data {
    _musicListGroups = data;
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
