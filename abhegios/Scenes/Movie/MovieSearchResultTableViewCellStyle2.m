//
//  MovieSearchResultTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/4/1.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieSearchResultTableViewCellStyle2.h"
#import "GroupInfo.h"
#import "MovieInfo.h"

@implementation MovieSearchResultTableViewCellStyle2

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    GroupInfo *infoGroup = data;
    [_infoView0 setData:[[infoGroup entitys] objectAtIndex:0]];
    [_infoView1 setData:[[infoGroup entitys] objectAtIndex:1]];
}

@end
