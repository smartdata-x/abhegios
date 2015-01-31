//
//  BookThemeTableViewCellStyle1.h
//  abhegios
//
//  Created by Archer_LJ on 15/1/31.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookInfoViewStyle3.h"
@interface BookThemeTableViewCellStyle1 : UITableViewCell
@property (weak, nonatomic) IBOutlet BookInfoViewStyle3 *infoView;
- (void)setData:(id)data;
@end
