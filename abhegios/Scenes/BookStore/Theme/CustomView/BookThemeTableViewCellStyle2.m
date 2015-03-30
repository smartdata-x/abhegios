//
//  BookThemeTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookThemeTableViewCellStyle2.h"
#import "BookInfo.h"
@implementation BookThemeTableViewCellStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_infoView setData:data];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
