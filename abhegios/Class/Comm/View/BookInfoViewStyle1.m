//
//  BookInfoViewStyle1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookInfoViewStyle1.h"
#import "BookInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation BookInfoViewStyle1
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setData:(id)data {
    [_name setText:[data name]];
    [_logoButton.imageView setImageWithStrURL:[BaseInfoAdapter getPic:data]];
}

@end
