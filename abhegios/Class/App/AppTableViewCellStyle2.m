//
//  AppTableViewCellStyle2.m
//  abhegios
//
//  Created by 180 on 15/1/20.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "AppTableViewCellStyle2.h"
#import "AppInfo.h"
#import  <OEZCommSDK/OEZCommSDK.h>
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"
@implementation AppTableViewCellStyle2


-(OEZPageViewCell*) pageView:(OEZPageView *)pageView cellForPageAtIndex:(NSInteger)pageIndex
{
    OEZPageViewImageCell *cell = [pageView dequeueReusableCellWithIdentifier:@"PageViewImageCell"];
    [[cell contentImage]setImageWithStrURL:[BaseInfoAdapter getPic:[self.data objectAtIndex:pageIndex]]];
    return cell;
}

@end
