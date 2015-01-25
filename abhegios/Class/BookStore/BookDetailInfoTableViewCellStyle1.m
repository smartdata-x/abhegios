//
//  BookDetailInfoTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookDetailInfoTableViewCellStyle1.h"

@implementation BookDetailInfoTableViewCellStyle1

- (void)awakeFromNib {
    [super awakeFromNib];
    [[_freeRead layer] setCornerRadius:2.0f];
    [[_freeRead layer] setMasksToBounds:YES];
    [[_saveShelf layer] setCornerRadius:2.0f];
    [[_saveShelf layer] setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
}

@end
