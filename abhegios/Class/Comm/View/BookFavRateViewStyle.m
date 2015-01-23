//
//  BookFavRateViewStyle.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookFavRateViewStyle.h"

@implementation BookFavRateViewStyle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

+ (CGSize)sizeOfFavRate:(NSInteger)favRate {
    favRate = MAX(0, favRate);
    favRate = MIN(kMaxFavRate, favRate);
    float width = 24;
    if (favRate >= 1) {
        width = 24 * ((favRate + 1) / 2);
    }
    return CGSizeMake(width, 23);
}

- (void)setData:(NSInteger)favRate {
    favRate = MAX(0, favRate);
    favRate = MIN(kMaxFavRate, favRate);
    float width = 24;
    float height = 23;
    if (favRate == 0) {
        UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book_nostar.png"]];
        [view setFrame:CGRectMake(0, 0, width, height)];
        [self addSubview:view];
        return;
    }
    else {
        BOOL hasHalf = favRate % 2;
        int fullStarCount = favRate / 2;
        for (int i=0; i<fullStarCount; i++) {
            float x = [[self subviews] count] * width;
            UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book_star.png"]];
            [view setFrame:CGRectMake(x, 0, width, height)];
            [self addSubview:view];
        }
        if (hasHalf) {
            float x = [[self subviews] count] * width;
            UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book_half_star.png"]];
            [view setFrame:CGRectMake(x, 0, width, height)];
            [self addSubview:view];
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
