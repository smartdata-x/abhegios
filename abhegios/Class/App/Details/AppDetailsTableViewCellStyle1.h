//
//  AppDetailsTableViewCellStyle1.h
//  abhegios
//
//  Created by 180 on 15/1/24.
//  Copyright (c) 2015年 180. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OEZCommSDK/OEZCommSDK.h>
#import "FavRateViewStyle.h"
@interface AppDetailsTableViewCellStyle1 : OEZTableViewCell<OEZPageViewDelegate>
@property (weak, nonatomic) IBOutlet OEZPageView *pageView;
@property (weak, nonatomic) IBOutlet UILabel *sizeAndVer;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet FavRateViewStyle *favRate;
@property (weak, nonatomic) IBOutlet UIButton *downButton;

@end
