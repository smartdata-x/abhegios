//
//  MovieCenterTableViewCellStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieCenterTableViewCellStyle3.h"
#import "MovieInfo.h"
#import "GroupInfo.h"

@implementation MovieCenterTableViewCellStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setData:(id)data {
    GroupInfo *movieInfoGroup = data;
    [super setData:[movieInfoGroup entitys]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
