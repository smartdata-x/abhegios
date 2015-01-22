//
//  PageView.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OEZPageView;
@protocol OEZPageViewDelegate <NSObject>
-(NSInteger) numberPageCountPageView:(OEZPageView*) pageView;
-(UIView*)   pageView:(OEZPageView*) pageView viewForPageAtIndex:(NSInteger) pageIndex;
-(void )     pageView:(OEZPageView*) pageView didSelectPageAtIndex:(NSInteger) pageIndex;
@end
@interface OEZPageView : UIView<UIScrollViewDelegate>
@property (readonly) UIScrollView*  scrollView;
@property(nonatomic,assign) id<OEZPageViewDelegate>     delegate;
- (void)reloadData; 
@end
