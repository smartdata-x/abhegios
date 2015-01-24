//
//  AppTableViewCellPage.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellPage.h"
#import "AppInfoGroup.h"
@implementation AppTableViewCellPage

- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void) setData:(id)data
{
    [super setData:data];
    [self.pageView reloadData];
}


-(NSInteger) numberPageCountPageView:(OEZPageView *)pageView
{
    return [[self.data appInfos] count];
}

-(void) pageView:(OEZPageView *)pageView didSelectPageAtIndex:(NSInteger)pageIndex
{
    NSLog(@"didSelectRPageAtIndex %@",@(pageIndex));
}



@end
