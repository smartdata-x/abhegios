//
//  BookDetailInfoTableViewCellStyle0.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle0.h"
#import "BookInfo.h"
#import "BookDetailInfo.h"

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
    // 重构一个，切换summary和author
    BookDetailInfo *detailInfo = (BookDetailInfo *)data;
    BookInfo *bookInfo = [[BookInfo alloc] init];
    bookInfo.name = detailInfo.name;
    bookInfo.summary = detailInfo.author;
    bookInfo.star = detailInfo.star;
    [_bookInfoView setData:bookInfo];
}

@end
