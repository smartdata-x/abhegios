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
#import "AppInfoGroup.h"

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
    AppInfoGroup *appInfoGroup = [[AppInfoGroup alloc] init];
    appInfoGroup.style = bookInfoGroup.style;
    appInfoGroup.title = bookInfoGroup.title;
    appInfoGroup.key = bookInfoGroup.key;
    appInfoGroup.appInfos = bookInfoGroup.bookInfos;
    //[appInfoGroup setAppInfosDictionarys:bookInfoGroup.bookInfos];
    [super setData:appInfoGroup];
    
    //[super setData:data];
}

@end
