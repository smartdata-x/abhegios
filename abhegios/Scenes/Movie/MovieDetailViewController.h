//
//  MovieDetailViewController.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewController.h"
#import "MovieDetailTableViewCellStyle4.h"

@interface MovieDetailViewController : RefreshTableViewController<MovieDetailTableViewCellStyle4Delegate>
- (void)setData:(id)data;
@end
