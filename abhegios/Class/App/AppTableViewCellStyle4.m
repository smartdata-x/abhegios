//
//  AppTableViewCellStyle4.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle4.h"

@implementation AppTableViewCellStyle4




-(OEZPageViewCell*) pageView:(OEZPageView *)pageView viewForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewCell *cell = [pageView dequeueReusablePageViewWithIdentifier:nil];
    if( cell == nil)
    {
        cell = [[OEZPageViewCell alloc] init];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 4, kMainScreenWidth-24, kTableViewCellHieght-8)];
        [imageView setImage:[UIImage imageNamed:@"app_banner"]];
        [cell addSubview:imageView];
    }
    return cell;
}
@end
