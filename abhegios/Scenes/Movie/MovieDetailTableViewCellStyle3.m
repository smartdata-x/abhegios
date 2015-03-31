//
//  MovieDetailTableViewCellStyle3.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailTableViewCellStyle3.h"
#import "MovieInfo.h"
#import "GroupInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation MovieDetailTableViewCellStyle3

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(id)data {
    [super setData:data];
    // 临时广告图片
    UIImageView *advertImage = [[UIImageView alloc] initWithFrame:self.frame];
    [advertImage setImageWithStrURL:[BaseInfoAdapter getPic:data]];
    [self addSubview:advertImage];
}

@end
