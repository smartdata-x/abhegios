//
//  MovieDetailTableViewCellStyle4.m
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieDetailTableViewCellStyle4.h"
#import "MovieInfo.h"
#import "MovieHScrollViewCell1.h"
#import "GroupInfo.h"
#import "UIImageView+AFNetworking.h"
#import "BaseInfoAdapter.h"

@implementation MovieDetailTableViewCellStyle4

- (NSInteger)numberColumnCountHScrollView:(OEZHScrollView *)hScrollView {
    return [self.data count];
}

- (CGFloat)hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex {
    return 160.0f;
}

- (OEZHScrollViewCell *)hScrollView:(OEZHScrollView *)hScrollView cellForColumnAtIndex:(NSInteger)columnIndex {
    static NSString *identifier = @"MovieHScrollViewCell1";
    MovieHScrollViewCell1 *cell = [hScrollView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MovieHScrollViewCell1 alloc] initWithReuseIdentifier:identifier];
    }
    [cell setData:[self.data objectAtIndex:columnIndex]];
    return cell;
}

- (void)hScrollView:(OEZHScrollView *)pageView didSelectColumnAtIndex:(NSInteger)columnIndex {
    [self didSelectRowColumn:columnIndex];
    if ([_delegate respondsToSelector:@selector(cellItemClickedAtIndex:)]) {
        MovieInfo *movieInfo = [self.data objectAtIndex:columnIndex];
        [_delegate cellItemClickedAtIndex:movieInfo];
    }
}

@end
