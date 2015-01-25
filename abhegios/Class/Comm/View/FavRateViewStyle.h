//
//  BookFavRateViewStyle.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#define kMinFavRate 0
#define kMaxFavRate 5
@interface FavRateViewStyle : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *rate0;
@property (weak, nonatomic) IBOutlet UIImageView *rate1;
@property (weak, nonatomic) IBOutlet UIImageView *rate2;
@property (weak, nonatomic) IBOutlet UIImageView *rate3;
@property (weak, nonatomic) IBOutlet UIImageView *rate4;
- (void)setData:(float)rate;
@end
