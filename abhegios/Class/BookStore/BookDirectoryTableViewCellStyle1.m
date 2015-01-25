//
//  BookDirectoryTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDirectoryTableViewCellStyle1.h"
#import "BookInfo.h"

@implementation BookDirectoryTableViewCellStyle1

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [super setData:data];
    [_name setText:[(BookInfo *)data name]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
