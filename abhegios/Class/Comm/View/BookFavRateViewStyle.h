//
//  BookFavRateViewStyle.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kMinFavRate 0
#define kMaxFavRate 10
@interface BookFavRateViewStyle : UIView
+ (CGSize)sizeOfFavRate:(NSInteger)favRate;
- (void)setData:(NSInteger)favRate;
@end
