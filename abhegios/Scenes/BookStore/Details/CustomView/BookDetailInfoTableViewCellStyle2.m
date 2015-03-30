//
//  TableViewCell.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle2.h"
#import "BookDetailInfo.h"

@implementation BookDetailInfoTableViewCellStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    BookDetailPage *detailPage = (BookDetailPage *)data;
    [_introduction setText:[[detailPage summary] summary]];
}

@end
