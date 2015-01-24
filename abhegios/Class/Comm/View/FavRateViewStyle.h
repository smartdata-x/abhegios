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
@interface FavRateViewStyle : OEZNibView
@property (weak, nonatomic) IBOutlet UIView *rate0;
@property (weak, nonatomic) IBOutlet UIView *rate1;
@property (weak, nonatomic) IBOutlet UIView *rate2;
@property (weak, nonatomic) IBOutlet UIView *rate3;
@property (weak, nonatomic) IBOutlet UIView *rate4;
- (void)setData:(NSUInteger)rate;
- (void)setDataWithBgColor:(NSUInteger)rate Color:(UIColor *)color;
@end
