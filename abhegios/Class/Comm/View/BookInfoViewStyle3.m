//
//  BookInfoViewStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoViewStyle3.h"
#import "BookInfo.h"

@implementation BookInfoViewStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_logo setImage:[UIImage imageNamed:[(BookInfo *)data logo]]];
    [_name setText:[data name]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
