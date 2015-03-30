//
//  MovieHScrollViewCell1.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieHScrollViewCell1.h"

@implementation MovieHScrollViewCell1
{
    MovieInfoViewStyle2 *_movieInfoView;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _movieInfoView = [MovieInfoViewStyle2 loadFromNib];
        [self addSubview:_movieInfoView];
    }
    return self;
}

- (void)setData:(id)data {
    [_movieInfoView setData:data];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_movieInfoView setFrame:[self bounds]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
