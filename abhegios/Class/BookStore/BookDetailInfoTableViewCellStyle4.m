//
//  BookDetailInfoTableViewCellStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle4.h"

@implementation BookDetailInfoTableViewCellStyle4

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    [_lblTag0 setText:@"爱情"];
    [_lblTag1 setText:@"动作"];
    [_lblTag2 setText:@"惊悚"];
}

@end
