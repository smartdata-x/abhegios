//
//  BookDetailInfoTableViewCellStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle3.h"
#import "BookInfo.h"

@implementation BookDetailInfoTableViewCellStyle3

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    BookInfo *bookinfo = [[BookInfo alloc] init];
    bookinfo.logo = @"bookmark.png";
    bookinfo.name = @"共22章";
    [_allChapter setData:bookinfo];
}

@end
