//
//  BookDetailInfoTableViewCellStyle0.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle0.h"
#import "BookInfo.h"

@implementation BookDetailInfoTableViewCellStyle0

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    
    BookInfo *info = [[BookInfo alloc] init];
    info.name = @"金刚经";
    info.summary = @"作者:释迦摩尼";
    info.star = 10;
    
    [_bookInfoView setData:data];
}

@end
