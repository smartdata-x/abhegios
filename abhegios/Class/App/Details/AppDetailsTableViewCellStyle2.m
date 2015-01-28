//
//  AppDetailsTableViewCellStyle2.m
//  abhegios
//
//  Created by 180 on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppDetailsTableViewCellStyle2.h"
#import "AppDetailsInfo.h"
@implementation AppDetailsTableViewCellStyle2

-(void) setData:(id)data
{
    [super setData:data];
    CGRect rect = [_contentText frame];
    [_contentText setText:[data summary]];
    rect.size.height =  [_contentText sizeThatFits: CGSizeMake(CGRectGetWidth([_contentText frame]), MAXFLOAT)].height;
    [_contentText setNumberOfLines:0]; 
    [_contentText setFrame:rect];
    
}
@end
