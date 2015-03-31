//
//  MovieCenterTableViewCellStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/30.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MovieCenterTableViewCellStyle1Delegate <NSObject>
- (void)cellItemClickedAtIndex:(id)movieInfo;
@end

@interface MovieCenterTableViewCellStyle1 : OEZTableViewHScrollCell<OEZHScrollViewDelegate>
@property (nonatomic, assign) id <MovieCenterTableViewCellStyle1Delegate> delegate;
@end
