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
#import  <OEZCommSDK/OEZCommSDK.h>
@implementation AppTableViewCellStyle2


-(OEZPageViewCell*) pageView:(OEZPageView *)pageView viewForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewImageCell *cell = [pageView dequeueReusablePageViewWithIdentifier:@"PageViewImageCell"];
    return cell;
}

@end
