//
//  AppTableViewCellStyle4.m
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle4.h"
#import "UIImageView+AFNetworking.h"
#import "AppInfo.h"
#import "BaseInfoAdapter.h"
@implementation AppTableViewCellStyle4


-(OEZPageViewCell*) pageView:(OEZPageView *)pageView cellForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewImageCell *cell = [pageView dequeueReusableCellWithIdentifier:@"PageViewImageCell1"];
    [[cell contentImage]setImageWithStrURL:[BaseInfoAdapter getPic:[self.data objectAtIndex:pageIndex]]];
    return cell;
}

-(void) pageView:(OEZPageView *)pageView didSelectPageAtIndex:(NSInteger)pageIndex
{
    [self didSelectRowColumn:pageIndex];
}
@end
