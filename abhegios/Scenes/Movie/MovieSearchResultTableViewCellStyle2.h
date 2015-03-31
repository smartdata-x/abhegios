//
//  MovieSearchResultTableViewCellStyle2.h
//  abhegios
//
//  Created by Archer_LJ on 15/4/1.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfoViewStyle2.h"

@protocol MovieSearchResultTableViewCellStyle2Delegate <NSObject>
- (void)cellItemClickedAtIndex:(id)movieInfo;
@end

@interface MovieSearchResultTableViewCellStyle2 : OEZTableViewHScrollCell<OEZHScrollViewDelegate>
@property (nonatomic, assign) id <MovieSearchResultTableViewCellStyle2Delegate> delegate;
@end
