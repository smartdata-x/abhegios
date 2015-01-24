//
//  BookInfoViewStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoViewStyle1.h"
#import "BookInfo.h"

@implementation BookInfoViewStyle1
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_name setText:[data name]];
    [_summary setText:[(BookInfo *)data summary]];
}

- (void)showAll {
    [_name setHidden:NO];
    [_summary setHidden:NO];
}

- (void)setDataWithFormat:(id)data Format:(NSInteger)format {
    [self setData:data];
    [self showAll];
    switch (format) {
        case BookInfoViewStyle1Format2: [_name setHidden:YES];
        case BookInfoViewStyle1Format1: [_summary setHidden:YES];
        default: break;
    }
}

@end
