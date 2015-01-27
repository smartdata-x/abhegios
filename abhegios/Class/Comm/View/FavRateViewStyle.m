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

- (void)setData:(float)rate {
    [self showAll];
    BOOL hasHalf = rate - (int)rate > 0.4;
    UIImage *halfStar = [UIImage imageNamed:@"halfstar.jpg"];
    int fullStar = (int)rate;
    fullStar = MAX(kMinFavRate, fullStar);
    fullStar = MIN(kMaxFavRate, fullStar);
    int hideStar = kMaxFavRate - fullStar;
    
    switch (hideStar) {
        case 5:[_rate0 setHidden:YES];
        case 4:[_rate1 setHidden:YES];
        case 3:[_rate2 setHidden:YES];
        case 2:[_rate3 setHidden:YES];
        case 1:[_rate4 setHidden:YES];
        default: break;
    }
    
    if (hasHalf) {
        switch (fullStar) {
            case 4:
                [_rate4 setHidden:NO];
                [_rate4 setImage:halfStar];
                break;
                
            case 3:
                [_rate3 setHidden:NO];
                [_rate3 setImage:halfStar];
                break;
                
            case 2:
                [_rate2 setHidden:NO];
                [_rate2 setImage:halfStar];
                break;
                
            case 1:
                [_rate1 setHidden:NO];
                [_rate1 setImage:halfStar];
                break;
                
            case 0:
                [_rate0 setHidden:NO];
                [_rate0 setImage:halfStar];
                break;
                
            default:
                break;
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
