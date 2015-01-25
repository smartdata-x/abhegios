//
//  AppTableViewCellStyle4.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle4.h"

@implementation AppTableViewCellStyle4




-(OEZPageViewCell*) pageView:(OEZPageView *)pageView cellForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewImageCell *cell = [pageView dequeueReusableCellWithIdentifier:@"PageViewImageCell1"];
    return cell;
}
@end
