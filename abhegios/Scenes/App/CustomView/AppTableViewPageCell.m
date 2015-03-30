//
//  AppTableViewCellPage.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewPageCell.h"
@implementation AppTableViewPageCell






-(NSInteger) numberPageCountPageView:(OEZPageView *)pageView
{
    return [self.data count];
}

-(void) pageView:(OEZPageView *)pageView didShowPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"didShowPageAtIndex %@",@(pageIndex));
}




-(void) pageView:(OEZPageView *)pageView didSelectPageAtIndex:(NSInteger)pageIndex
{
    [self didSelectRowColumn:pageIndex];
}

@end
