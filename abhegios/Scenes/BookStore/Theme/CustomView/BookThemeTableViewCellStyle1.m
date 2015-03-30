//
//  BookThemeTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookThemeTableViewCellStyle1.h"
#import "BookTopicInfo.h"
@implementation BookThemeTableViewCellStyle1

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    BookInfo *bookinfo = [[BookInfo alloc] init];
    bookinfo.pic = @"follow_ico.png";
    bookinfo.name = [NSString stringWithFormat:@"%ld人关注", (long)[(BookTopicInfo *)data follow]];
    [_infoView setData:bookinfo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
