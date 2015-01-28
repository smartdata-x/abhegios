//
//  AppInfoViewStyle3.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppInfoViewStyle3.h"

@implementation AppInfoViewStyle3
- (void)awakeFromNib
{
    [super awakeFromNib];
    [[_logo layer] setCornerRadius:8.0f];
    [[_logo layer] setMasksToBounds:YES];
    
}

-(void) setData:(id)data
{
    [_name setText:[data name]];
    [_name setLineBreakMode:NSLineBreakByTruncatingTail];
}

@end
