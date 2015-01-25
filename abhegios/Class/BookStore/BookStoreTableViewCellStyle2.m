//
//  BookStoreTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookStoreTableViewCellStyle2.h"
#import "BookInfo.h"
#import "BookInfoGroup.h"

@implementation BookStoreTableViewCellStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    
    BookInfoGroup *bookInfoGroup = data;
    [super setData:[bookInfoGroup bookInfos]];
    
    //[super setData:data];
}

@end
