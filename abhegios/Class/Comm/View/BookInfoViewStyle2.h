//
//  BookInfoViewStyle2.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavRateViewStyle.h"

@interface BookInfoViewStyle2 : OEZNibView
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet FavRateViewStyle *favRate;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *summary;
- (void)setData:(id)data;
@end
