//
//  OEZHScrollView.h
//  OEZCommSDK
//
//  Created by 180 on 15/1/25.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OEZHScrollViewCell : UIView<NSCoding>
@end

@class OEZHScrollView;
@protocol OEZHScrollViewDelegate <NSObject,UIScrollViewDelegate>
@required
-(NSInteger) numberColumnCountHScrollView:(OEZHScrollView*) hScrollView;
-(CGFloat)   hScrollView:(OEZHScrollView *)hScrollView  widthForColumnAtIndex:(NSInteger)columnIndex;
-(OEZHScrollViewCell*)   hScrollView:(OEZHScrollView*) hScrollView cellForColumnAtIndex:(NSInteger) columnIndex;
@optional
-(void )     hScrollView:(OEZHScrollView*) pageView didSelectColumnAtIndex:(NSInteger) columnIndex;
@end

@interface OEZHScrollView : UIScrollView
@property(nonatomic,assign) id<OEZHScrollViewDelegate>  delegate;
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;
- (void) reloadData;
@end
