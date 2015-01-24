//
//  BookStoreTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/21.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle1.h"
#import "bookInfo.h"
#import "FavRateViewStyle.h"

@implementation BookStoreTableViewCellStyle1

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    [_bookInfoView setData:data];
}

@end
