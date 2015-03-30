//
//  PageView.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/22.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OEZViewCell.h"

@interface OEZPageViewCell : OEZViewCell
@end

@interface OEZPageViewImageCell : OEZPageViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@end

@class OEZPageView;
@protocol OEZPageViewDelegate <NSObject,UIScrollViewDelegate>
@required
-(NSInteger) numberPageCountPageView:(OEZPageView*) pageView;
-(OEZPageViewCell*)   pageView:(OEZPageView*) pageView cellForPageAtIndex:(NSInteger) pageIndex;
@optional
-(void )     pageView:(OEZPageView*) pageView didSelectPageAtIndex:(NSInteger) pageIndex;
-(void )     pageView:(OEZPageView*) pageView didShowPageAtIndex:(NSInteger) pageIndex;
@end
@interface OEZPageView : UIView<UIScrollViewDelegate>
@property (readonly) UIScrollView*  scrollView;
@property (readonly) UIPageControl* pageControl;
@property(nonatomic,assign) id<OEZPageViewDelegate>     delegate;
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;
- (void)reloadData;
-(void) setPageIndex:(NSInteger) pageIndex;
@end
