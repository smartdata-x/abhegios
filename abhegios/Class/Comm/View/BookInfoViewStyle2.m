//
//  BookInfoViewStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoViewStyle2.h"
#import "BookInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation BookInfoViewStyle2

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_name setText:[data name]];
    [_summary setText:[(BookInfo *)data summary]];
    [_favRate setData:[(BookInfo *)data star]];
    [(UIImageView *)self.logo setImageWithStrURL:[BaseInfoAdapter getPic:data]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
