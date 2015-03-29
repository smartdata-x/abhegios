//
//  MovieInfoViewStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieInfoViewStyle2.h"
#import "MovieInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation MovieInfoViewStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_viewStyle1.name setText:[data summary]];
    [_viewStyle1.logo setImageWithStrURL:[BaseInfoAdapter getPic:data]];
    [_secName setText:[data name]];
    [_watchNumber setText:[NSString stringWithFormat:@"播放次数:%lu次", (unsigned long)[data play]]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
