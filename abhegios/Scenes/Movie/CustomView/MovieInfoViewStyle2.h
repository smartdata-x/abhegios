//
//  MovieInfoViewStyle2.h
//  abhegios
//
//  Created by Archer_LJ on 15/3/29.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfoViewStyle1.h"

@interface MovieInfoViewStyle2 : OEZNibView
@property (weak, nonatomic) IBOutlet MovieInfoViewStyle1 *viewStyle1;
@property (weak, nonatomic) IBOutlet UILabel *secName;
@property (weak, nonatomic) IBOutlet UILabel *watchNumber;
- (void)setData:(id)data;
@end
