//
//  AppTableViewCellStyle2.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle2.h"
#import "AppInfo.h"
#import "AppInfoGroup.h"
@implementation AppTableViewCellStyle2


-(OEZPageViewCell*) pageView:(OEZPageView *)pageView viewForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewCell *cell = [pageView dequeueReusablePageViewWithIdentifier:nil];
    if( cell == nil)
    {
        cell = [[OEZPageViewCell alloc] init];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kTableViewCellHieght)];
        [imageView setImage:[UIImage imageNamed:@"s_banner"]];
        [cell addSubview:imageView];
    }
    return cell;
}

@end
