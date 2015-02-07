//
//  MusicFMTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/2/2.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MusicFMTableViewCellStyle1.h"

@implementation MusicFMTableViewCellStyle1

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_name setText:data];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
