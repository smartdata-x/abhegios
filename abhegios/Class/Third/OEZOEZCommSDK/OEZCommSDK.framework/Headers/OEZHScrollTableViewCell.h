//
//  OEZHScrollTableViewCell.h
//  OEZCommSDK
//
//  Created by 180 on 14/9/21.
//  Copyright (c) 2014年 180. All rights reserved.
//

#import <OEZCommSDK/OEZCommSDK.h>

@interface OEZHScrollTableViewCell : OEZTableViewCell
{
}
@property (readonly) UIScrollView* scrollView;
-(void) setContentWidth:(CGFloat) width;
@end
