//
//  MovieSearchResultTableViewCellStyle2.m
//  abhegios
//
//  Created by Archer_LJ on 15/4/1.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import "MovieSearchResultTableViewCellStyle2.h"
#import "GroupInfo.h"
#import "MovieInfo.h"
#import "MovieHScrollViewCell1.h"

@implementation MovieSearchResultTableViewCellStyle2

- (NSInteger)numberColumnCountHScrollView:(OEZHScrollView *)hScrollView {
    [self.hScrollView setScrollEnabled:NO];
    NSInteger count = [self.data count];
    return count;
}

- (CGFloat)hScrollView:(OEZHScrollView *)hScrollView widthForColumnAtIndex:(NSInteger)columnIndex {
    return kMainScreenWidth / 2.0f;
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
