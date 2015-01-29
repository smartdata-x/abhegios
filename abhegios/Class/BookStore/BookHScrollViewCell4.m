//
//  BookHScrollViewCell4.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookHScrollViewCell4.h"
#import "BookInfoViewStyle4.h"

@implementation BookHScrollViewCell4
{
    BookInfoViewStyle4 *_bookInfoView;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _bookInfoView = [BookInfoViewStyle4 loadFromNib];
        [self addSubview:_bookInfoView];
    }
    return self;
}

- (void)setData:(id)data {
    [_bookInfoView setData:data];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_bookInfoView setFrame:[self bounds]];
}

@end
