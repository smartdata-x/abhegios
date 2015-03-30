//
//  BookStoreTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle2.h"
#import "BookInfo.h"
#import "GroupInfo.h"

@implementation BookStoreTableViewCellStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    
    GroupInfo *bookInfoGroup = data;
    [super setData:[bookInfoGroup entitys]];
    
    //[super setData:data];
}

@end
