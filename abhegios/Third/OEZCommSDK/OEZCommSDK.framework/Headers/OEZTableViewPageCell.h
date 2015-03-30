//
//  OEZTableViewPageCell.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface OEZTableViewPageCell : OEZTableViewCell<OEZPageViewDelegate>
@property (nonatomic,readonly) OEZPageView *pageView;
@end
