//
//  AppTableViewCellPage.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewPageCell.h"
@implementation AppTableViewPageCell



-(void) setData:(id)data
{
    if( self.data != data )
    {
        [super setData:data];
        [self.pageView reloadData];
    }
}


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
    NSLog(@"didSelectPageAtIndex %@",@(pageIndex));
}


@end
