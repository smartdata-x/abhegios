//
//  AppHScrollViewCell1.m
//  abhegios
//
//  Created by 180 on 15/1/26.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppHScrollViewCell1.h"

@implementation AppHScrollViewCell1

- (void)awakeFromNib
{
    [super awakeFromNib];
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
}

-(void) setData:(id)data
{
    [_name setText:[data name]];
}
@end
