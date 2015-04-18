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

- (void)setColorStyle:(FavRateColorStyle)style {
    _colorStyle = style;
    UIImageView *rates[] = {_rate0, _rate1, _rate2, _rate3, _rate4};
    NSString *defaultImgName = @"star";
    
    if (_colorStyle == FavRateColorStyleWhite) {
        defaultImgName = @"book_star_white.png";
    }
    
    for (int i=0; i<kMaxFavRate; i++) {
        [rates[i] setImage:[UIImage imageNamed:defaultImgName]];
    }
}

- (void)setData:(float)rate {
    [self showAll];
    BOOL hasHalf = rate - (int)rate > 0.4;
    UIImage *halfStar = [UIImage imageNamed:@"halfstar.jpg"];
    if (_colorStyle == FavRateColorStyleWhite) {
        halfStar = [UIImage imageNamed:@"book_half_star_white.png"];
    }
    int fullStar = (int)rate;
    fullStar = MAX(kMinFavRate, fullStar);
    fullStar = MIN(kMaxFavRate, fullStar);
    
    UIImageView *rates[] = {_rate0, _rate1, _rate2, _rate3, _rate4};
    for (int i=0; i<kMaxFavRate; i++) {
        if (i>=fullStar) {
            [rates[i] setHidden:YES];
            if (hasHalf) {
                [rates[i] setHidden:NO];
                [rates[i] setImage:halfStar];
                hasHalf = NO;
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
