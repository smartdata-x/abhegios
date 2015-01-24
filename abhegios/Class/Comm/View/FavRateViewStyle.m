//
//  BookFavRateViewStyle.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "FavRateViewStyle.h"
#import "BookInfo.h"

@implementation FavRateViewStyle
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)showAll {
    [_rate0 setHidden:NO];
    [_rate1 setHidden:NO];
    [_rate2 setHidden:NO];
    [_rate3 setHidden:NO];
    [_rate4 setHidden:NO];
}

- (void)setData:(NSUInteger)rate {
    [self showAll];
    
    rate = MAX(kMinFavRate, rate);
    rate = MIN(kMaxFavRate, rate);
    BOOL hasHalf = rate % 2;
    int fullStar = (int)rate / 2;
    int hideStar = 5 - fullStar;
    
    switch (hideStar) {
        case 5:[_rate0 setHidden:YES];
        case 4:[_rate1 setHidden:YES];
        case 3:[_rate2 setHidden:YES];
        case 2:[_rate3 setHidden:YES];
        case 1:[_rate4 setHidden:YES];
        default: break;
    }
}

- (void)setDataWithBgColor:(NSUInteger)rate Color:(UIColor *)color {
    [self setData:rate];
    [self setBackgroundColor:color];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
