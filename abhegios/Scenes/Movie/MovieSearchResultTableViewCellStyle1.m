//
//  MovieSearchResultTableViewCellStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/4/1.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieSearchResultTableViewCellStyle1.h"

@implementation MovieSearchResultTableViewCellStyle1

- (void)awakeFromNib {
    [super awakeFromNib];
    [[_btnHot layer] setCornerRadius:2.0f];
    [[_btnHot layer] setMasksToBounds:YES];
    [[_btnNew layer] setCornerRadius:2.0f];
    [[_btnNew layer] setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
}

@end
