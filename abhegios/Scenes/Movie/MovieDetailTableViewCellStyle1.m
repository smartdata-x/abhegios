//
//  MovieDetailTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailTableViewCellStyle1.h"
#import "GroupInfo.h"
#import "MovieDetailInfo.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation MovieDetailTableViewCellStyle1

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    MovieDetail *detail = data;
    if (detail) {
        NSURL *movieUrl = [NSURL URLWithString:detail.url];
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:movieUrl];
        [player setControlStyle:MPMovieControlStyleNone];
        [player.view setFrame:CGRectMake(0, 0, 320, 180)];
        [player.view setBackgroundColor:[UIColor clearColor]];
        [self addSubview:player.view];
        [player play];
    }
}

@end
