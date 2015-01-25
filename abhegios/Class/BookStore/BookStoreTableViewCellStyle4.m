//
//  BookStoreTableViewCellStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle4.h"
#import "BookInfo.h"
#import "GroupInfo.h"

@implementation BookStoreTableViewCellStyle4

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    GroupInfo *bookInfoGroup = data;
    int count = [[bookInfoGroup entitys] count];
    count = count >= 1 ? 1 : count;
    for (int i=0; i<count; i++) {
        BookInfo *bookInfo = [[bookInfoGroup entitys] objectAtIndex:i];
        [_name setText:bookInfo.name];
        [_summary setText:bookInfo.summary];
        [_favRate setData:bookInfo.star];
    }
}

@end
