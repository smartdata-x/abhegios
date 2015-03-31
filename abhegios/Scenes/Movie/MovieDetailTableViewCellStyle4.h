//
//  MovieDetailTableViewCellStyle4.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MovieDetailTableViewCellStyle4Delegate <NSObject>
- (void)cellItemClickedAtIndex:(id)movieInfo;
@end

@interface MovieDetailTableViewCellStyle4 : OEZTableViewHScrollCell<OEZHScrollViewDelegate>
@property (nonatomic, assign) id <MovieDetailTableViewCellStyle4Delegate> delegate;
@end
