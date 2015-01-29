//
//  BookHScrollViewCell1.m
//  abhegios
//
//  Created by Archer_LJ on 15/1/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "BookHScrollViewCell1.h"
#import "BookInfoViewStyle1.h"
@implementation BookHScrollViewCell1
{
    BookInfoViewStyle1 *_bookInfoView;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _bookInfoView = [BookInfoViewStyle1 loadFromNib];
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
