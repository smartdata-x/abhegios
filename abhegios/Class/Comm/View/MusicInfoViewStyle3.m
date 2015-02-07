//
//  MusicInfoViewStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/7.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicInfoViewStyle3.h"

@implementation MusicInfoViewStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(NSString *)leftName Right:(NSString *)rightName LeftMajor:(BOOL)leftMajor {
    [_leftButton setTitle:leftName forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forState:UIControlStateNormal];
    [_rightButton setTitle:rightName forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] forState:UIControlStateNormal];
    if (leftMajor) [_leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    else [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
