//
//  PageView.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OEZPageView : UIView
@property (readonly) UIScrollView*  scrollView;
@property (readonly) NSArray     *  pageViews;

-(void) addPageView:(UIView*) pageView;
@end
