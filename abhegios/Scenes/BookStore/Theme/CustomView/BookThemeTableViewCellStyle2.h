//
//  BookThemeTableViewCellStyle2.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookInfoViewStyle2.h"
@interface BookThemeTableViewCellStyle2 : UITableViewCell
@property (weak, nonatomic) IBOutlet BookInfoViewStyle2 *infoView;
- (void)setData:(id)data;
@end
