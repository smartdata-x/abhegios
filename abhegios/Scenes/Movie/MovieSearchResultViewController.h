//
//  MovieSearchResultViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewController.h"
#import "MovieSearchResultTableViewCellStyle2.h"

@interface MovieSearchResultViewController : RefreshTableViewController<MovieSearchResultTableViewCellStyle2Delegate>
- (void)setData:(NSInteger)data;
@end
