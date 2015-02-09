//
//  BookHScrollViewCell1.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "BookInfoViewStyle1.h"

@protocol BookHScrollViewCell1Delegate <NSObject>
- (void)didBookHScrollViewCell1Clicked:(id)clickedView;
@end

@interface BookHScrollViewCell1 : OEZHScrollViewCell<BookInfoViewStyle1Delegate>
@property (nonatomic, retain) id<BookHScrollViewCell1Delegate> delegate;
- (void)setData:(id)data;
@end
