//
//  MovieDetailTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailTableViewCellStyle2.h"
#import "MovieDetailInfo.h"

@implementation MovieDetailTableViewCellStyle2

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [_content setText:[(MovieDetail *)data content]];
    [_content setNumberOfLines:0];
}

@end
