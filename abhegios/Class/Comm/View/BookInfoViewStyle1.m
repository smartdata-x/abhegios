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
    [_logo setImageWithStrURL:[BaseInfoAdapter getPic:data]];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClicked:)];
    [self addGestureRecognizer:gesture];
}

- (void)didClicked:(UIGestureRecognizer *)gesture {
    if ([_delegate respondsToSelector:@selector(didBookInfoViewStyle1Clicked:)]) {
        [_delegate didBookInfoViewStyle1Clicked:self];
    }
}

@end
