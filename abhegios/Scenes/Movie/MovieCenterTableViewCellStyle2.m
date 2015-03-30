//
//  MovieCenterTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieCenterTableViewCellStyle2.h"
#import "GroupInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation MovieCenterTableViewCellStyle2

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setData:(id)data {
    [super setData:data];
    GroupInfo *movieInfoGroup = data;
    [_movieInfoView setData:[[movieInfoGroup entitys] objectAtIndex:0]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
