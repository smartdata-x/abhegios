//
//  AppTableViewCellPage.h
//  abhegios
//
//  Created by 180 on 15/1/23.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>
#define kTableViewCellHieght 80
@interface AppTableViewCellPage : OEZTableViewCell<OEZPageViewDelegate>
{
    @protected
    OEZPageView*    _pageView;
}
@end
