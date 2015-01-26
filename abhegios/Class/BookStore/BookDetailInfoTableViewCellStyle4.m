//
//  BookDetailInfoTableViewCellStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle4.h"
#import "BookDetailInfo.h"

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
    //[_lblTag0 setText:@"爱情"];
    //[_lblTag1 setText:@"动作"];
    //[_lblTag2 setText:@"惊悚"];
}

- (void)showAll {
    [_lblTag2 setHidden:NO];
    [_lblTag1 setHidden:NO];
    [_lblTag0 setHidden:NO];
}

- (void)hideAll {
    [_lblTag2 setHidden:YES];
    [_lblTag1 setHidden:YES];
    [_lblTag0 setHidden:YES];
}

- (void)setDataWithIndex:(id)data Index:(NSInteger)index {
    [self hideAll];
    [super setData:data];
    int offset = index * 3;
    int count = [[(BookDetailInfo *)data label] count];
    int leftCount = count - offset;
    leftCount = leftCount > 3 ? 3 : leftCount;
    switch (leftCount) {
        case 3:
            [_lblTag2 setText:[[(BookDetailInfo *)data label] objectAtIndex:offset+2]];
            [_lblTag2 setHidden:NO];
        case 2:
            [_lblTag1 setText:[[(BookDetailInfo *)data label] objectAtIndex:offset+1]];
            [_lblTag1 setHidden:NO];
        case 1:
            [_lblTag0 setText:[[(BookDetailInfo *)data label] objectAtIndex:offset+0]];
            [_lblTag0 setHidden:NO];
        default: break;
    }
}

@end
