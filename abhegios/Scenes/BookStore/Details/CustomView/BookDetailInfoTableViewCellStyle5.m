//
//  BookDetailInfoTableViewCellStyle5.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle5.h"
#import "BookInfo.h"

@implementation BookDetailInfoTableViewCellStyle5

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    BookInfo *bookinfo = [[BookInfo alloc] init];
    bookinfo.pic = @"tryread_icon.png";
    bookinfo.name = @"免费阅读";
    [_freeRead setData:bookinfo];
    [_freeRead.name setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    bookinfo.pic = @"download_icon.png";
    bookinfo.name = @"下载全本";
    [_download setData:bookinfo];
    [_download.name setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

@end